<div align="center">

![dokai-logo](https://raw.githubusercontent.com/osai-ai/dokai/master/pics/dokai-logo.png)

![Build and push](https://github.com/osai-ai/dokai/workflows/Build%20and%20push/badge.svg)
[![Generic badge](https://img.shields.io/badge/License-MIT-<COLOR>.svg)](https://shields.io/)

</div>

Collection of Docker images for ML/DL and video processing projects. 

## Overview of images

Three types of images differ by tag postfix:

* `base`: Python with ML and CV packages, CUDA (11.4.2), cuDNN (8.2.4), FFmpeg (4.4) with NVENC support
* `pytorch`: PyTorch (1.10.0), torchvision (0.11.1), torchaudio (0.10.0) and torch based libraries
* `tensor-stream`: Tensor Stream for real-time video streams decoding on GPU 

## Example

Pull an image 
```Bash
docker pull ghcr.io/osai-ai/dokai:21.11-pytorch
```

Docker Hub [mirror](https://hub.docker.com/r/osaiai/dokai/tags)
```bash
docker pull osaiai/dokai:21.11-pytorch
```

Check available GPUs inside container
```bash
docker run --rm \
    --gpus=all \
    ghcr.io/osai-ai/dokai:21.11-pytorch \
    nvidia-smi
```

Example of using dokai image for DL pipeline you can find [here](https://github.com/osai-ai/dokai/tree/master/example).

## Versions 

### base

<details><summary>dokai:20.09-base</summary>
<p>

[ghcr.io/osai-ai/dokai:20.09-base](https://github.com/orgs/osai-ai/packages/container/dokai/89195)

FFmpeg (release/4.3), nv-codec-headers (sdk/9.1)  
Python (3.6.9)  

pip==20.2.3  
setuptools==50.3.0  
packaging==20.4  
numpy==1.19.2  
opencv-python==4.4.0.42  
scipy==1.5.2  
matplotlib==3.3.2  
pandas==1.1.2  
notebook==6.1.4  
scikit-learn==0.23.2  
scikit-image==0.17.2  
albumentations==0.4.6  
Cython==0.29.21  
Pillow==7.2.0  
trafaret-config==2.0.2  
pyzmq==19.0.2  
librosa==0.8.0  
psutil==5.7.2  
dataclasses==0.7  

</p>
</details>

<details><summary>dokai:20.10-base</summary>
<p>

[ghcr.io/osai-ai/dokai:20.10-base](https://github.com/orgs/osai-ai/packages/container/dokai/176382)

FFmpeg (release/4.3), nv-codec-headers (sdk/9.1)  
Python (3.6.9)  

pip==20.2.4  
setuptools==50.3.2  
packaging==20.4  
numpy==1.19.2  
opencv-python==4.4.0.44  
scipy==1.5.3  
matplotlib==3.3.2  
pandas==1.1.3  
notebook==6.1.4  
scikit-learn==0.23.2  
scikit-image==0.17.2  
albumentations==0.5.0  
Cython==0.29.21  
Pillow==8.0.0  
trafaret-config==2.0.2  
pyzmq==19.0.2  
librosa==0.8.0  
psutil==5.7.2  
dataclasses==0.7  
pydantic==1.6.1  
requests==2.24.0 

</p>
</details>

<details><summary>dokai:20.12-base</summary>
<p>

[ghcr.io/osai-ai/dokai:20.12-base](https://github.com/orgs/osai-ai/packages/container/dokai/623505)

CUDA (11.1), cuDNN (8.0.5)  
FFmpeg (release/4.3), nv-codec-headers (sdk/9.1)  
Python (3.8.5)  

pip==20.3.3  
setuptools==51.0.0  
packaging==20.8  
numpy==1.19.4  
opencv-python==4.4.0.46  
scipy==1.5.4  
matplotlib==3.3.3  
pandas==1.1.5  
notebook==6.1.5  
scikit-learn==0.23.2  
scikit-image==0.18.0  
albumentations==0.5.2  
Cython==0.29.21  
Pillow==8.0.1  
trafaret-config==2.0.2  
pyzmq==20.0.0  
librosa==0.8.0  
psutil==5.8.0  
pydantic==1.7.3  
requests==2.25.1  

</p>
</details>

<details><summary>dokai:21.01-base</summary>
<p>

[ghcr.io/osai-ai/dokai:21.01-base](https://github.com/orgs/osai-ai/packages/container/dokai/858256)

CUDA (11.1.1), cuDNN (8.0.5)  
FFmpeg (release/4.3), nv-codec-headers (sdk/10.0)  
Python (3.8.5)  

pip==20.3.3  
setuptools==51.3.3  
packaging==20.8  
numpy==1.19.5  
opencv-python==4.5.1.48  
scipy==1.6.0  
matplotlib==3.3.3  
pandas==1.2.0  
notebook==6.2.0  
scikit-learn==0.24.1  
scikit-image==0.18.1  
albumentations==0.5.2  
Cython==0.29.21  
Pillow==8.1.0  
trafaret-config==2.0.2  
pyzmq==21.0.1  
librosa==0.8.0  
psutil==5.8.0  
pydantic==1.7.3  
requests==2.25.1  

</p>
</details>

<details><summary>dokai:21.02-base</summary>
<p>

[ghcr.io/osai-ai/dokai:21.02-base](https://github.com/orgs/osai-ai/packages/container/dokai/1242092)

CUDA (11.2.1), cuDNN (8.1.0)  
FFmpeg (release/4.3), nv-codec-headers (sdk/10.0)  
Python (3.8.5)  

pip==21.0.1  
setuptools==53.0.0  
packaging==20.9  
numpy==1.20.1  
opencv-python==4.5.1.48  
scipy==1.6.1  
matplotlib==3.3.4  
pandas==1.2.2  
scikit-learn==0.24.1  
scikit-image==0.18.1  
Pillow==8.1.0  
librosa==0.8.0  
albumentations==0.5.2  
pyzmq==22.0.3  
Cython==0.29.22  
numba==0.52.0  
requests==2.25.1  
psutil==5.8.0  
trafaret-config==2.0.2  
pydantic==1.7.3  
PyYAML==5.4.1  
notebook==6.2.0  
ipywidgets==7.6.3  
tqdm==4.57.0  
pytest==6.2.2  
mypy==0.812  
flake8==3.8.4  

</p>
</details>

<details><summary>dokai:21.03-base</summary>
<p>

[ghcr.io/osai-ai/dokai:21.03-base](https://github.com/orgs/osai-ai/packages/container/dokai/1661596)

CUDA (11.2.2), cuDNN (8.1.1)  
FFmpeg (release/4.4), nv-codec-headers (sdk/10.0)  
Python (3.8.5)  

pip==21.0.1  
setuptools==54.2.0  
packaging==20.9  
numpy==1.20.1  
opencv-python==4.5.1.48  
scipy==1.6.1  
matplotlib==3.3.4  
pandas==1.2.3  
scikit-learn==0.24.1  
scikit-image==0.18.1  
Pillow==8.1.2  
librosa==0.8.0  
albumentations==0.5.2  
pyzmq==22.0.3  
Cython==0.29.22  
numba==0.53.0  
requests==2.25.1  
psutil==5.8.0  
trafaret-config==2.0.2  
pydantic==1.8.1  
PyYAML==5.4.1  
notebook==6.3.0  
ipywidgets==7.6.3  
tqdm==4.59.0  
pytest==6.2.2  
mypy==0.812  
flake8==3.9.0  

</p>
</details>

<details><summary>dokai:21.05-base</summary>
<p>

[ghcr.io/osai-ai/dokai:21.05-base](https://github.com/orgs/osai-ai/packages/container/dokai/2467512?tag=21.05-base)

CUDA (11.3), cuDNN (8.2.0)  
FFmpeg (release/4.4), nv-codec-headers (sdk/10.0)  
Python (3.8.5)  

pip==21.1.1  
setuptools==56.2.0  
packaging==20.9  
numpy==1.20.3  
opencv-python==4.5.2.52  
scipy==1.6.3  
matplotlib==3.4.2  
pandas==1.2.4  
scikit-learn==0.24.2  
scikit-image==0.18.1  
Pillow==8.2.0  
librosa==0.8.0  
albumentations==0.5.2  
pyzmq==22.0.3  
Cython==0.29.23  
numba==0.53.1  
requests==2.25.1  
psutil==5.8.0  
trafaret-config==2.0.2  
pydantic==1.8.1  
PyYAML==5.4.1  
notebook==6.3.0  
ipywidgets==7.6.3  
tqdm==4.60.0  
pytest==6.2.4  
mypy==0.812  
flake8==3.9.2  

</p>
</details>

<details><summary>dokai:21.07-base</summary>
<p>

[ghcr.io/osai-ai/dokai:21.07-base](https://github.com/osai-ai/dokai/pkgs/container/dokai/3600567)

CUDA (11.3.1), cuDNN (8.2.0)  
FFmpeg (release/4.4), nv-codec-headers (sdk/10.0)  
Python (3.8.10)  

pip==21.1.3  
setuptools==57.0.0  
packaging==20.9  
numpy==1.21.0  
opencv-python==4.5.2.54  
scipy==1.7.0  
matplotlib==3.4.2  
pandas==1.2.5  
scikit-learn==0.24.2  
scikit-image==0.18.2  
Pillow==8.2.0  
librosa==0.8.1  
albumentations==1.0.0  
pyzmq==22.1.0  
Cython==0.29.23  
numba==0.53.1  
requests==2.25.1  
psutil==5.8.0  
trafaret-config==2.0.2  
pydantic==1.8.2  
PyYAML==5.4.1  
notebook==6.4.0  
ipywidgets==7.6.3  
tqdm==4.61.1  
pytest==6.2.4  
mypy==0.910  
flake8==3.9.2  

</p>
</details>

<details><summary>dokai:21.08-base</summary>
<p>

[ghcr.io/osai-ai/dokai:21.08-base](https://github.com/osai-ai/dokai/pkgs/container/dokai/6484719)

CUDA (11.4.1), cuDNN (8.2.2)  
FFmpeg (release/4.4), nv-codec-headers (sdk/11.0)  
Python (3.8.10)  

pip==21.2.3  
setuptools==57.4.0  
packaging==21.0  
numpy==1.21.1  
opencv-python==4.5.3.56  
scipy==1.7.1  
matplotlib==3.4.2  
pandas==1.3.1  
scikit-learn==0.24.2  
scikit-image==0.18.2  
Pillow==8.3.1  
librosa==0.8.1  
albumentations==1.0.3  
pyzmq==22.2.1  
Cython==0.29.24  
numba==0.53.1  
requests==2.26.0  
psutil==5.8.0  
pydantic==1.8.2  
PyYAML==5.4.1  
notebook==6.4.3  
ipywidgets==7.6.3  
tqdm==4.62.0  
pytest==6.2.4  
mypy==0.910  
flake8==3.9.2  

</p>
</details>

<details><summary>dokai:21.09-base</summary>
<p>

[ghcr.io/osai-ai/dokai:21.09-base](https://github.com/osai-ai/dokai/pkgs/container/dokai/8318925?tag=21.09-base)

CUDA (11.4.2), cuDNN (8.2.4)  
FFmpeg (release/4.4), nv-codec-headers (sdk/11.0)  
Python (3.8.10)  

pip==21.2.4  
setuptools==58.1.0  
packaging==21.0  
numpy==1.21.2  
opencv-python==4.5.3.56  
scipy==1.7.1  
matplotlib==3.4.3  
pandas==1.3.3  
scikit-learn==1.0  
scikit-image==0.18.3  
Pillow==8.3.2  
librosa==0.8.1  
albumentations==1.0.3  
pyzmq==22.3.0  
Cython==0.29.24  
numba==0.53.1  
requests==2.26.0  
psutil==5.8.0  
pydantic==1.8.2  
PyYAML==5.4.1  
notebook==6.4.4  
ipywidgets==7.6.5  
tqdm==4.62.3  
pytest==6.2.5  
mypy==0.910  
flake8==3.9.2  

</p>
</details>

<details><summary>dokai:21.11-base</summary>
<p>

[ghcr.io/osai-ai/dokai:21.11-base](https://github.com/osai-ai/dokai/pkgs/container/dokai/10048323?tag=21.11-base)

CUDA (11.4.2), cuDNN (8.2.4)  
FFmpeg (release/4.4), nv-codec-headers (sdk/11.0)  
Python (3.8.10)  
CMake (3.21.4)

pip==21.3.1  
setuptools==58.5.3  
packaging==21.2  
numpy==1.21.4  
opencv-python==4.5.4.58  
scipy==1.7.2  
matplotlib==3.4.3  
pandas==1.3.4  
scikit-learn==1.0.1  
scikit-image==0.18.3  
Pillow==8.4.0  
librosa==0.8.1  
albumentations==1.1.0  
pyzmq==22.3.0  
Cython==0.29.24  
numba==0.53.1  
requests==2.26.0  
psutil==5.8.0  
pydantic==1.8.2  
PyYAML==6.0  
notebook==6.4.5  
ipywidgets==7.6.5  
tqdm==4.62.3  
pytest==6.2.5  
mypy==0.910  
flake8==4.0.1  

</p>
</details>

### pytorch

<details><summary>dokai:20.09-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:20.09-pytorch](https://github.com/orgs/osai-ai/packages/container/dokai/89197)

additionally to `dokai:20.09-base`:

torch==1.6.0  
torchvision==0.7.0  
pytorch-argus==0.1.2  
timm==0.2.1  
apex (master)  

</p>
</details>

<details><summary>dokai:20.10-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:20.10-pytorch](https://github.com/orgs/osai-ai/packages/container/dokai/176388)

additionally to `dokai:20.10-base`:

torch==1.6.0  
torchvision==0.7.0  
pytorch-argus==0.1.2  
timm==0.2.1  
apex (master)  

</p>
</details>

<details><summary>dokai:20.12-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:20.12-pytorch](https://github.com/orgs/osai-ai/packages/container/dokai/623509)

additionally to `dokai:20.12-base`:

torch==1.7.1 (source, v1.7.1 tag)  
torchvision==0.8.2 (source, v0.8.2 tag)  
pytorch-argus==0.2.0  
timm==0.3.2  
kornia==0.4.1  
apex (source, master branch)  

</p>
</details>

<details><summary>dokai:21.01-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:21.01-pytorch](https://github.com/orgs/osai-ai/packages/container/dokai/858271)

additionally to `dokai:21.01-base`:

torch==1.8.0a0+4aea007 (source, master branch)  
torchvision==0.8.2 (source, v0.8.2 tag)  
pytorch-argus==0.2.0  
timm==0.3.4  
kornia==0.4.1  
apex (source, master branch)  

</p>
</details>

<details><summary>dokai:21.02-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:21.02-pytorch](https://github.com/orgs/osai-ai/packages/container/dokai/1242106)

additionally to `dokai:21.02-base`:

torch==1.9.0a0+c2b9283 (source, master branch)  
torchvision==0.8.2 (source, v0.8.2 tag)  
pytorch-argus==0.2.0  
timm==0.4.4 (source, master branch)  
kornia==0.4.1  
pretrainedmodels==0.7.4  
efficientnet-pytorch==0.7.0  
segmentation-models-pytorch==0.1.3  
apex (source, master branch)  

</p>
</details>

<details><summary>dokai:21.03-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:21.03-pytorch](https://github.com/orgs/osai-ai/packages/container/dokai/1661643)

additionally to `dokai:21.03-base`:

torch==1.8.0 (source, v1.8.0 tag)  
torchvision==0.9.0 (source, v0.9.0 tag)  
torchaudio==0.8.0 (source, v0.8.0 tag)  
pytorch-argus==0.2.1  
timm==0.4.5  
kornia==0.5.0  
pretrainedmodels==0.7.4  
efficientnet-pytorch==0.7.0  
segmentation-models-pytorch==0.1.3  
apex (source, master branch)  

</p>
</details>

<details><summary>dokai:21.05-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:21.05-pytorch](https://github.com/orgs/osai-ai/packages/container/dokai/2467547?tag=21.05-pytorch)

additionally to `dokai:21.05-base`:

torch==1.8.1 (source, v1.8.1 tag)  
torchvision==0.9.1 (source, v0.9.1 tag)  
torchaudio==0.8.1 (source, v0.8.1 tag)  
pytorch-argus==0.2.1  
timm==0.4.8 (source, master branch)  
kornia==0.5.1  
pretrainedmodels==0.7.4  
efficientnet-pytorch==0.7.1  
segmentation-models-pytorch==0.1.3  
apex (source, master branch)  

</p>
</details>

<details><summary>dokai:21.07-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:21.07-pytorch](https://github.com/osai-ai/dokai/pkgs/container/dokai/3600591)

additionally to `dokai:21.07-base`:

torch==1.9.0 (source, v1.9.0 tag)  
torchvision==0.10.0 (source, v0.10.0 tag)  
torchaudio==0.9.0 (source, v0.9.0 tag)  
pytorch-argus==0.2.1  
pretrainedmodels==0.7.4  
efficientnet-pytorch==0.7.1  
timm==0.4.12  
segmentation-models-pytorch==0.1.3  
kornia==0.5.5  
apex (source, master branch)  

</p>
</details>

<details><summary>dokai:21.08-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:21.08-pytorch](https://github.com/osai-ai/dokai/pkgs/container/dokai/6484815)

additionally to `dokai:21.08-base`:

MAGMA (2.6.1)

torch==1.10.0a0+git5b8389e (source, master branch)  
torchvision==0.10.0 (source, v0.10.0 tag)  
torchaudio==0.9.0 (source, v0.9.0 tag)  
pytorch-ignite==0.4.6  
pytorch-argus==0.2.1  
pretrainedmodels==0.7.4  
efficientnet-pytorch==0.7.1  
timm==0.4.12  
segmentation-models-pytorch==0.2.0  
kornia==0.5.8  
apex (source, master branch)  

</p>
</details>

<details><summary>dokai:21.09-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:21.09-pytorch](https://github.com/osai-ai/dokai/pkgs/container/dokai/8319003?tag=21.09-pytorch)

additionally to `dokai:21.09-base`:

MAGMA (2.6.1)

torch==1.10.0-rc1 (source, v1.10.0-rc1 tag)  
torchvision==0.10.1 (source, v0.10.1 tag)  
torchaudio==0.9.1 (source, v0.9.1 tag)  
pytorch-ignite==0.4.6  
pytorch-argus==0.2.1  
pretrainedmodels==0.7.4  
efficientnet-pytorch==0.7.1  
timm==0.4.12  
segmentation-models-pytorch==0.2.0  
kornia==0.5.11  
apex (source, master branch)  

</p>
</details>

<details><summary>dokai:21.11-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:21.11-pytorch](https://github.com/osai-ai/dokai/pkgs/container/dokai/10048416?tag=21.11-pytorch)

additionally to `dokai:21.11-base`:

MAGMA (2.6.1)

torch==1.10.0 (source, v1.10.0 tag)  
torchvision==0.11.1 (source, v0.11.1 tag)  
torchaudio==0.10.0 (source, v0.10.0 tag)  
pytorch-ignite==0.4.7   
pytorch-argus==1.0.0  
pretrainedmodels==0.7.4  
efficientnet-pytorch==0.7.1  
timm==0.4.12  
segmentation-models-pytorch==0.2.0  
kornia==0.6.1  

</p>
</details>

### tensor-stream

<details><summary>dokai:20.09-tensor-stream</summary>
<p>

[ghcr.io/osai-ai/dokai:20.09-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/89200)

additionally to `dokai:20.09-pytorch`:

tensor-stream==0.4.6 (dev)  

</p>
</details>

<details><summary>dokai:20.10-tensor-stream</summary>
<p>

[ghcr.io/osai-ai/dokai:20.10-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/176389)

additionally to `dokai:20.10-pytorch`:

tensor-stream==0.4.6 (dev)  

</p>
</details>

<details><summary>dokai:20.12-tensor-stream</summary>
<p>

[ghcr.io/osai-ai/dokai:20.12-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/623510)

additionally to `dokai:20.12-pytorch`:

tensor-stream==0.4.6 (source, dev branch) 

</p>
</details>

<details><summary>dokai:21.01-tensor-stream</summary>
<p>

[ghcr.io/osai-ai/dokai:21.01-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/858272)

additionally to `dokai:21.01-pytorch`:

tensor-stream==0.4.6 (source, dev branch) 

</p>
</details>

<details><summary>dokai:21.02-tensor-stream</summary>
<p>

[ghcr.io/osai-ai/dokai:21.02-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/1242107)

additionally to `dokai:21.02-pytorch`:

tensor-stream==0.4.6 (source, dev branch)  

</p>
</details>

<details><summary>dokai:21.03-tensor-stream</summary>
<p>

[ghcr.io/osai-ai/dokai:21.03-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/1661648)

additionally to `dokai:21.03-pytorch`:

tensor-stream==0.4.6 (source, dev branch)  

</p>
</details>

<details><summary>dokai:21.05-tensor-stream</summary>
<p>

[ghcr.io/osai-ai/dokai:21.05-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/2467549?tag=21.05-tensor-stream)

additionally to `dokai:21.05-pytorch`:

tensor-stream==0.4.6 (source, dev branch)  

</p>
</details>

<details><summary>dokai:21.07-tensor-stream</summary>
<p>

[ghcr.io/osai-ai/dokai:21.07-tensor-stream](https://github.com/osai-ai/dokai/pkgs/container/dokai/3600595)

additionally to `dokai:21.07-pytorch`:

tensor-stream==0.4.6 (source, dev branch)  

</p>
</details>

<details><summary>dokai:21.08-tensor-stream</summary>
<p>

[ghcr.io/osai-ai/dokai:21.08-tensor-stream](https://github.com/osai-ai/dokai/pkgs/container/dokai/6484817)

additionally to `dokai:21.08-pytorch`:

tensor-stream==0.4.6 (source, dev branch)  

</p>
</details>

<details><summary>dokai:21.09-tensor-stream</summary>
<p>

[ghcr.io/osai-ai/dokai:21.09-tensor-stream](https://github.com/osai-ai/dokai/pkgs/container/dokai/8319006?tag=21.09-tensor-stream)

additionally to `dokai:21.09-pytorch`:

tensor-stream==0.4.6 (source, dev branch)  

</p>
</details>

<details><summary>dokai:21.11-tensor-stream</summary>
<p>

[ghcr.io/osai-ai/dokai:21.11-tensor-stream](https://github.com/osai-ai/dokai/pkgs/container/dokai/10048418?tag=21.11-tensor-stream)

additionally to `dokai:21.11-pytorch`:

tensor-stream==0.4.6 (source, dev branch)  

</p>
</details>
