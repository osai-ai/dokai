import pytest


class TestImports:

    @pytest.mark.cpu
    @pytest.mark.gpu
    @pytest.mark.base
    @pytest.mark.pytorch
    @pytest.mark.rootful
    @pytest.mark.rootless
    def test_base_imports(self):
        import numpy
        import cv2
        import sympy
        import scipy
        import matplotlib
        import pandas
        import sklearn
        import skimage
        import PIL
        import albumentations
        import zmq
        import Cython
        import requests
        import psutil
        import pydantic
        import yaml
        import notebook
        import ipywidgets
        import tqdm

    @pytest.mark.cpu
    @pytest.mark.pytorch
    @pytest.mark.rootful
    @pytest.mark.rootless
    def test_cpu_pytorch_imports(self):
        import torch
        import torchvision
        import torchaudio

        import argus
        import kornia
        import timm

    @pytest.mark.gpu
    @pytest.mark.pytorch
    @pytest.mark.rootful
    @pytest.mark.rootless
    def test_gpu_pytorch_imports(self):
        import tensorrt
        import torch
        import torchvision
        import torchaudio

        import argus
        import kornia
        import timm

    @pytest.mark.gpu
    @pytest.mark.video
    @pytest.mark.rootful
    @pytest.mark.rootless
    def test_gpu_video_imports(self):
        import PyNvCodec
        import PytorchNvCodec
        import tensor_stream

    @pytest.mark.cpu
    @pytest.mark.pytorch
    @pytest.mark.rootful
    @pytest.mark.rootless
    def test_cuda_is_not_available(self):
        import torch
        assert torch.cuda.is_available() is False
        assert torch.backends.cudnn.is_available() is False

    @pytest.mark.gpu
    @pytest.mark.pytorch
    @pytest.mark.rootful
    @pytest.mark.rootless
    def test_cuda_is_available(self):
        import torch
        assert torch.cuda.is_available()
        assert torch.backends.cudnn.is_available()
