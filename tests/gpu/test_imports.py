import pytest


class TestImports:

    @pytest.mark.gpu_base
    def test_imports(self):
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

        import tensorrt
        import torch
        import torchvision
        import torchaudio

        import argus
        import kornia
        import timm

        import PyNvCodec
        import PytorchNvCodec
        import tensor_stream

    @pytest.mark.gpu_base
    def test_cuda_is_available(self):
        import torch
        assert torch.cuda.is_available()
        assert torch.backends.cudnn.is_available()
