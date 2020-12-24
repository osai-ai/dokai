# Example

Train EfficientNet B0 on CIFAR with [argus](https://github.com/lRomul/argus) and [timm](https://github.com/rwightman/pytorch-image-models). 

## Manual 

Pull an image with PyTorch
```bash
docker pull ghcr.io/osai-ai/dokai:20.12-pytorch
```

Run training
```bash
docker run --rm -it \
    --gpus=all \
    --ipc=host \
    -v $(pwd):/workdir \
    --name=dokai-example \
    ghcr.io/osai-ai/dokai:20.12-pytorch \
    python cifar_advanced.py --batch_size 256 --lr 0.001
```

## Makefile

Build an image and enter bash session
```bash
make build
make run
```
or just 
```bash
make
```
then run training
```bash
make COMMAND="python cifar_advanced.py --batch_size 256 --lr 0.001"
```

Run training using command argument
```bash
make COMMAND="python cifar_advanced.py --batch_size 256 --lr 0.001"
```

Distributed data parallel training with Apex mixed precision and gradient accumulation
```bash
make GPUS=2 COMMAND="./cifar_advanced.sh 2 --batch_size 128 --lr 0.0005 --amp --iter_size 2"
```

Other Makefile targets
```bash
make  # stop, build, run

# do the same
make stop
make build
make run

make  # by default all GPUs passed 
make GPUS=all  # do the same
make GPUS=none  # without GPUs

make run GPUS=2  # pass the first two gpus
make run GPUS=device=1,2  # pass GPUs numbered 1 and 2

make logs
make exec  # runs a new command in a running container
make exec COMMAND="bash"  # do the same 
make stop
```
