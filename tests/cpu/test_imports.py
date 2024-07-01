import pytest


class TestImports:

    @pytest.mark.cpu_base
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
