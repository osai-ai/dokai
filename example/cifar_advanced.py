import os
import argparse
from pathlib import Path

import torch
import torch.distributed as dist
from torch.nn import SyncBatchNorm
from torch.utils.data import DataLoader, DistributedSampler
from torch.nn.parallel import DistributedDataParallel
from torchvision import transforms
from torchvision.datasets import CIFAR10

import timm

import argus
from argus.utils import deep_to, deep_detach, deep_chunk
from argus.metrics import Metric
from argus.callbacks import (
    MonitorCheckpoint,
    EarlyStopping,
    CosineAnnealingLR,
    LoggingToCSV,
    LoggingToFile
)

torch.backends.cudnn.benchmark = True

CIFAR_DATA_DIR = Path('./data/cifar_data')
EXPERIMENT_DIR = Path('./data/experiment')


def get_linear_scaled_lr(base_lr, batch_size, base_batch_size=128):
    return base_lr * (batch_size / base_batch_size)


def get_data_loaders(batch_size, distributed, local_rank):
    mean = (0.4914, 0.4822, 0.4465)
    std = (0.2023, 0.1994, 0.2010)
    train_transform = transforms.Compose([
        transforms.RandomCrop(32, padding=4),
        transforms.RandomHorizontalFlip(),
        transforms.ToTensor(),
        transforms.Normalize(mean, std),
    ])

    test_transform = transforms.Compose([
        transforms.ToTensor(),
        transforms.Normalize(mean, std),
    ])

    train_dataset = CIFAR10(root=CIFAR_DATA_DIR, train=True,
                            transform=train_transform, download=True)
    val_dataset = CIFAR10(root=CIFAR_DATA_DIR, train=False,
                          transform=test_transform, download=False)

    train_sampler = None
    val_sampler = None
    if distributed:
        train_sampler = DistributedSampler(train_dataset,
                                           num_replicas=dist.get_world_size(),
                                           rank=local_rank,
                                           shuffle=True)
        val_sampler = DistributedSampler(val_dataset,
                                         num_replicas=dist.get_world_size(),
                                         rank=local_rank,
                                         shuffle=False)

    train_loader = DataLoader(train_dataset, num_workers=2, drop_last=True,
                              batch_size=batch_size, sampler=train_sampler,
                              shuffle=train_sampler is None)
    val_loader = DataLoader(val_dataset, num_workers=2, shuffle=False,
                            batch_size=batch_size * 2, sampler=val_sampler)
    return train_loader, val_loader


class CategoricalAccuracy(Metric):
    """You don't need to write a distributed metric if you don't
    want to validate in parallel. You can use regular metrics if you
    are not using DistributedSampler for validation data loader.
    """

    name = 'dist_accuracy'
    better = 'max'

    def __init__(self, distributed=False, world_size=1):
        self.distributed = distributed
        self.world_size = world_size

    def reset(self):
        self.correct = 0
        self.count = 0

    def update(self, step_output: dict):
        pred = step_output['prediction']
        trg = step_output['target']
        indices = torch.max(pred, dim=1)[1]
        correct = torch.eq(indices, trg).view(-1)
        correct_sum = torch.sum(correct)
        if self.distributed:
            reduce_correct_sum = correct_sum.clone()
            dist.all_reduce(reduce_correct_sum, op=dist.ReduceOp.SUM)
            correct_sum = reduce_correct_sum
            torch.cuda.synchronize()

        self.correct += correct_sum.item()
        self.count += correct.shape[0] * self.world_size

    def compute(self):
        if self.count == 0:
            raise Exception('Must be at least one example for computation')
        return self.correct / self.count


class CifarModel(argus.Model):
    nn_module = timm.create_model

    def __init__(self, params):
        super().__init__(params)
        self.iter_size = (1 if 'iter_size' not in self.params
                          else int(self.params['iter_size']))
        self.amp = (False if 'amp' not in self.params
                    else bool(self.params['amp']))
        self.scaler = torch.cuda.amp.GradScaler() if self.amp else None

    def train_step(self, batch, state) -> dict:
        self.train()
        self.optimizer.zero_grad()

        # Gradient accumulation
        for i, chunk_batch in enumerate(deep_chunk(batch, self.iter_size)):
            input, target = deep_to(chunk_batch, self.device, non_blocking=True)
            with torch.cuda.amp.autocast(enabled=self.amp):
                prediction = self.nn_module(input)
                loss = self.loss(prediction, target)
                loss = loss / self.iter_size

            if self.amp:
                self.scaler.scale(loss).backward()
            else:
                loss.backward()

        if self.amp:
            self.scaler.step(self.optimizer)
            self.scaler.update()
        else:
            self.optimizer.step()

        prediction = deep_detach(prediction)
        target = deep_detach(target)
        prediction = self.prediction_transform(prediction)
        return {
            'prediction': prediction,
            'target': target,
            'loss': loss.item()
        }


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--batch_size', type=int, default=256,
                        help='input batch size for training (default: 256)')
    parser.add_argument('--epochs', type=int, default=200,
                        help='number of epochs to train (default: 200)')
    parser.add_argument('--lr', type=float, default=0.001,
                        help='learning rate (default: 0.001)')
    parser.add_argument('--iter_size', type=int, default=1,
                        help='gradient accumulation step (default: 1)')
    parser.add_argument('--amp', action='store_true',
                        help='use Apex mixed precision')
    args = parser.parse_args()

    local_rank = 0
    if 'LOCAL_RANK' in os.environ:
        local_rank = int(os.environ['LOCAL_RANK'])

    distributed = False
    if 'WORLD_SIZE' in os.environ:
        distributed = int(os.environ['WORLD_SIZE']) > 1

    if distributed:
        torch.cuda.set_device(local_rank)
        dist.init_process_group(backend='nccl', init_method='env://')
        world_size = dist.get_world_size()
        world_batch_size = args.batch_size * world_size
    else:
        world_size = 1
        world_batch_size = args.batch_size
    print("World batch size:", world_batch_size)

    train_loader, val_loader = get_data_loaders(args.batch_size,
                                                distributed,
                                                local_rank)

    params = {
        'nn_module': {
            'model_name': 'tf_efficientnet_b0_ns',
            'pretrained': True,
            'num_classes': 10,
            'drop_rate': 0.2,
            'drop_path_rate': 0.2,
        },
        'optimizer': ('AdamW', {
            'lr': get_linear_scaled_lr(args.lr, world_batch_size)
        }),
        'loss': 'CrossEntropyLoss',
        'device': 'cuda',
        'amp': args.amp,
        'iter_size': args.iter_size
    }

    model = CifarModel(params)

    if distributed:
        model.nn_module = SyncBatchNorm.convert_sync_batchnorm(model.nn_module)
        model.nn_module = DistributedDataParallel(model.nn_module.to(local_rank),
                                                  device_ids=[local_rank],
                                                  output_device=local_rank)
        if local_rank:
            model.logger.disabled = True
    else:
        model.set_device('cuda')

    callbacks = []
    if local_rank == 0:
        callbacks += [
            MonitorCheckpoint(dir_path=EXPERIMENT_DIR,
                              monitor='val_dist_accuracy', max_saves=3),
            LoggingToCSV(EXPERIMENT_DIR / 'log.csv'),
            LoggingToFile(EXPERIMENT_DIR / 'log.txt')
        ]

    callbacks += [
        EarlyStopping(monitor='val_dist_accuracy', patience=30),
        CosineAnnealingLR(args.epochs),
    ]

    if distributed:
        @argus.callbacks.on_epoch_complete
        def schedule_sampler(state):
            state.data_loader.sampler.set_epoch(state.epoch + 1)
        callbacks += [schedule_sampler]

    model.fit(train_loader,
              val_loader=val_loader,
              num_epochs=args.epochs,
              metrics=[CategoricalAccuracy(distributed, world_size)],
              callbacks=callbacks)
