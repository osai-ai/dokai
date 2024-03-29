import torch


class TestTorch:

    def test_cuda_is_available(self):
        assert torch.cuda.is_available()
        assert torch.backends.cudnn.is_available()
