<div align="center">

![dokai-logo](https://raw.githubusercontent.com/osai-ai/dokai/master/pics/dokai-logo.png)

</div>

Collection of Docker images for ML/DL and video processing projects.

## Overview of images

Several types of images are presented:

* `base`: Python with ML and CV packages, CUDA (11.8.0), cuDNN (8.7.0), FFmpeg (6.0) with NVENC/NVDEC support
* `pytorch`: TensorRT (8.6.1), PyTorch (2.0.1), torchvision (0.15.2), torchaudio (2.0.2) and torch based libraries
* `tensor-stream`: Tensor Stream (0.5.0) for real-time video streams decoding on GPU
* `vpf`: VideoProcessingFramework (2.0.0) full HW acceleration for video decoding and encoding 

Supported NVIDIA architectures: Pascal (sm_60, sm_61), Volta (sm_70), Turing (sm_75), Ampere (sm_80, sm_86), Ada Lovelace (sm_89).  
You can identify the architecture of your GPU [here](https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/).

## Example

Pull an image
```Bash
docker pull ghcr.io/osai-ai/dokai:23.05-pytorch
```

Docker Hub [mirror](https://hub.docker.com/r/osaiai/dokai/tags)
```bash
docker pull osaiai/dokai:23.05-pytorch
```

Check available GPUs inside container
```bash
docker run --rm \
    --gpus=all \
    ghcr.io/osai-ai/dokai:23.05-pytorch \
    nvidia-smi
```

Example of using dokai image for DL pipeline you can find [here](https://github.com/osai-ai/dokai/tree/master/example).

## Versions

### base
<!---
==================================== BASE ====================================
-->

<details><summary style="margin-left: 20px;">dokai:23.05-base</summary>
<div style="margin-left: 20px;">

[ghcr.io/osai-ai/dokai:23.05-base](https://github.com/osai-ai/dokai/pkgs/container/dokai/93763687?tag=23.05-base)

Supported NVIDIA architectures: Pascal (sm_60, sm_61), Volta (sm_70), Turing (sm_75), Ampere (sm_80, sm_86), Ada Lovelace (sm_89).  

CUDA (11.8.0), cuDNN (8.7.0)
FFmpeg (n6.0), nv-codec-headers (n12.0.16.0)  
Python (3.10.6)  
CMake (3.22.1)  

pip==23.1.2  
setuptools==67.7.2  
packaging==23.1
numpy==1.24.3  
opencv-python==4.7.0.72  
sympy==1.12  
scipy==1.10.1  
matplotlib==3.7.1  
pandas==2.0.1  
scikit-learn==1.2.2  
scikit-image==0.20.0  
Pillow==9.5.0  
librosa==0.10.0.post2  
albumentations==1.3.0  
pyzmq==25.0.2  
Cython==0.29.34  
numba==0.57.0  
requests==2.30.0  
psutil==5.9.5  
pydantic==1.10.7  
PyYAML==6.0  
notebook==6.5.2  
ipywidgets==8.0.6  
tqdm==4.65.0  
pytest==7.3.1  
pytest-cov==4.0.0  
mypy==1.3.0  
flake8==6.0.0  
pre-commit==3.3.1  

</div>
</details>

<details><summary style="margin-left: 20px;">dokai:22.11-base</summary>
<div style="margin-left: 20px;">

[ghcr.io/osai-ai/dokai:22.11-base](https://github.com/osai-ai/dokai/pkgs/container/dokai/50579876?tag=22.11-base)

Supported NVIDIA architectures: Pascal (sm_60, sm_61), Volta (sm_70), Turing (sm_75), Ampere (sm_80, sm_86), Ada Lovelace (sm_89).  

CUDA (11.8.0), cuDNN (8.6.0)  
FFmpeg (release/4.4), nv-codec-headers (sdk/11.0)  
Python (3.10.6)  
CMake (3.22.1)  

pip==22.3.1  
setuptools==65.5.1  
packaging==21.3  
numpy==1.23.4  
opencv-python==4.6.0.66  
scipy==1.9.3  
matplotlib==3.6.2  
pandas==1.5.1  
scikit-learn==1.1.3  
scikit-image==0.19.3  
Pillow==9.3.0  
librosa==0.9.2  
albumentations==1.3.0  
pyzmq==24.0.1  
Cython==0.29.32  
numba==0.56.4  
requests==2.28.1  
psutil==5.9.4  
pydantic==1.10.2  
PyYAML==6.0  
notebook==6.5.2  
ipywidgets==8.0.2  
tqdm==4.64.1  
pytest==7.2.0  
pytest-cov==4.0.0  
mypy==0.991  
flake8==5.0.4  
pre-commit==2.20.0  

</div>
</details>

<details><summary style="margin-left: 20px;">dokai:22.03-base</summary>
<div style="margin-left: 20px;">

[ghcr.io/osai-ai/dokai:22.03-base](https://github.com/osai-ai/dokai/pkgs/container/dokai/17750505?tag=22.03-base)

CUDA (11.6.0)  
FFmpeg (release/4.4), nv-codec-headers (sdk/11.0)  
Python (3.8.10)  
CMake (3.22.2)  

pip==22.0.3  
setuptools==59.5.0  
packaging==21.3  
numpy==1.21.5  
opencv-python==4.5.5.62  
scipy==1.8.0  
matplotlib==3.5.1  
pandas==1.4.1  
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

</div>
</details>


<details><summary style="margin-left: 20px;">Older versions</summary>
<div style="margin-left: 40px;">

* <details><summary style="margin-left: 20px;">dokai:21.11-base</summary>

    [ghcr.io/osai-ai/dokai:21.11-base](https://github.com/osai-ai/dokai/pkgs/container/dokai/10097475?tag=21.11-base)
    
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

    </details>

* <details><summary>dokai:21.09-base</summary>

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

    </details>

* <details><summary>dokai:21.08-base</summary>

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

    </details>

* <details><summary>dokai:21.07-base</summary>

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

    </details>

* <details><summary>dokai:21.05-base</summary>

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

    </details>

* <details><summary>dokai:21.03-base</summary>

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

    </details>

* <details><summary>dokai:21.02-base</summary>

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

    </details>

* <details><summary>dokai:21.01-base</summary>

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

    </details>

* <details><summary>dokai:20.12-base</summary>

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

    </details>

* <details><summary>dokai:20.10-base</summary>

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

    </details>

* <details><summary>dokai:20.09-base</summary>

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

    </details>

</div>
</details>


### pytorch
<!---
==================================== PYTORCH ====================================
-->

<details><summary style="margin-left: 20px;">dokai:23.05-pytorch</summary>
<div style="margin-left: 20px;">

[ghcr.io/osai-ai/dokai:23.05-pytorch](https://github.com/osai-ai/dokai/pkgs/container/dokai/93954953?tag=23.05-pytorch)

additionally to `dokai:23.05-base`:

TensorRT (8.6.1)  
MAGMA (2.7.1)  

torch==2.0.1 (source, v2.0.1)  
torch_tensorrt (source, release/1.4)  
torchvision==0.15.2 (source, v0.15.2 tag)  
torchaudio==2.0.2 (source, v2.0.2 tag)  
pytorch-ignite==0.4.12  
pytorch-argus==1.0.0  
pretrainedmodels==0.7.4  
efficientnet-pytorch==0.7.1  
pytorch-toolbelt==0.6.3  
kornia==0.6.12  
timm==0.9.2  

</div>
</details>

<details><summary style="margin-left: 20px;">dokai:22.11-pytorch</summary>
<div style="margin-left: 20px;">

[ghcr.io/osai-ai/dokai:22.11-pytorch](https://github.com/osai-ai/dokai/pkgs/container/dokai/50580682?tag=22.11-pytorch)

additionally to `dokai:22.11-base`:

TensorRT (8.5.1)  
MAGMA (2.6.2)  

torch==1.14.0a0+git71fe069 (source, close to v1.13.0 after commit "ada lovelace (arch 8.9) support #87436")  
torchvision==0.14.0 (source, v0.14.0 tag)  
torchaudio==0.13.0 (source, v0.13.0 tag)  
pytorch-ignite==0.4.10  
pytorch-argus==1.0.0  
pretrainedmodels==0.7.4  
efficientnet-pytorch==0.7.1  
pytorch-toolbelt==0.5.2  
kornia==0.6.8  
timm==0.6.11  
segmentation-models-pytorch==0.3.0  

</div>
</details>

<details><summary style="margin-left: 20px;">dokai:22.03-pytorch</summary>
<div style="margin-left: 20px;">

[ghcr.io/osai-ai/dokai:22.03-pytorch](https://github.com/osai-ai/dokai/pkgs/container/dokai/17750784?tag=22.03-pytorch)

additionally to `dokai:22.03-base`:

MAGMA (2.6.1)  

torch==1.11.0 (source, v1.11.0 tag)  
torchvision==0.12.0 (source, v0.12.0 tag)  
torchaudio==0.11.0 (source, v0.11.0 tag)  
pytorch-ignite==0.4.8  
pytorch-argus==1.0.0  
pretrainedmodels==0.7.4  
efficientnet-pytorch==0.7.1  
timm==0.5.4  
segmentation-models-pytorch==0.2.1  
kornia==0.6.3  

</div>
</details>


<details><summary style="margin-left: 20px;">Older versions</summary>
<div style="margin-left: 40px;">

* <details><summary style="margin-left: 20px;">dokai:21.11-pytorch</summary>
    
    [ghcr.io/osai-ai/dokai:21.11-pytorch](https://github.com/osai-ai/dokai/pkgs/container/dokai/10097671?tag=21.11-pytorch)
    
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
    
    </details>

* <details><summary>dokai:21.09-pytorch</summary>

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

    </details>

* <details><summary>dokai:21.08-pytorch</summary>

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

    </details>

* <details><summary>dokai:21.07-pytorch</summary>

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

    </details>

* <details><summary>dokai:21.05-pytorch</summary>

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

    </details>

* <details><summary>dokai:21.03-pytorch</summary>

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

    </details>

* <details><summary>dokai:21.02-pytorch</summary>

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

    </details>

* <details><summary>dokai:21.01-pytorch</summary>

    [ghcr.io/osai-ai/dokai:21.01-pytorch](https://github.com/orgs/osai-ai/packages/container/dokai/858271)

    additionally to `dokai:21.01-base`:

    torch==1.8.0a0+4aea007 (source, master branch)  
    torchvision==0.8.2 (source, v0.8.2 tag)  
    pytorch-argus==0.2.0  
    timm==0.3.4  
    kornia==0.4.1  
    apex (source, master branch)  

    </details>

* <details><summary>dokai:20.12-pytorch</summary>

    [ghcr.io/osai-ai/dokai:20.12-pytorch](https://github.com/orgs/osai-ai/packages/container/dokai/623509)

    additionally to `dokai:20.12-base`:

    torch==1.7.1 (source, v1.7.1 tag)  
    torchvision==0.8.2 (source, v0.8.2 tag)  
    pytorch-argus==0.2.0  
    timm==0.3.2  
    kornia==0.4.1  
    apex (source, master branch)  

    </details>

* <details><summary>dokai:20.10-pytorch</summary>

    [ghcr.io/osai-ai/dokai:20.10-pytorch](https://github.com/orgs/osai-ai/packages/container/dokai/176388)

    additionally to `dokai:20.10-base`:

    torch==1.6.0  
    torchvision==0.7.0  
    pytorch-argus==0.1.2  
    timm==0.2.1  
    apex (master)  

    </details>

* <details><summary>dokai:20.09-pytorch</summary>

    [ghcr.io/osai-ai/dokai:20.09-pytorch](https://github.com/orgs/osai-ai/packages/container/dokai/89197)

    additionally to `dokai:20.09-base`:

    torch==1.6.0  
    torchvision==0.7.0  
    pytorch-argus==0.1.2  
    timm==0.2.1  
    apex (master)  

    </details>

</div>
</details>


### tensor-stream
<!---
==================================== TENSOR-STREAM ====================================
-->

<details><summary style="margin-left: 20px;">dokai:23.05-tensor-stream</summary>
<div style="margin-left: 20px;">

[ghcr.io/osai-ai/dokai:23.05-tensor-stream](https://github.com/osai-ai/dokai/pkgs/container/dokai/93954979?tag=23.05-tensor-stream)

additionally to `dokai:23.05-pytorch`:

tensor-stream==0.5.0 (source, 0.5.0 tag)

</div>
</details>

<details><summary style="margin-left: 20px;">dokai:22.11-tensor-stream</summary>
<div style="margin-left: 20px;">

[ghcr.io/osai-ai/dokai:22.11-tensor-stream](https://github.com/osai-ai/dokai/pkgs/container/dokai/50580709?tag=22.11-tensor-stream)

additionally to `dokai:22.11-pytorch`:

tensor-stream==0.4.6 (source, dev branch)

</div>
</details>

<details><summary style="margin-left: 20px;">dokai:22.03-tensor-stream</summary>
<div style="margin-left: 20px;">

[ghcr.io/osai-ai/dokai:22.03-tensor-stream](https://github.com/osai-ai/dokai/pkgs/container/dokai/17750801?tag=22.03-tensor-stream)

additionally to `dokai:22.03-pytorch`:

tensor-stream==0.4.6 (source, dev branch)

</div>
</details>


<details><summary style="margin-left: 20px;">Older versions</summary>
<div style="margin-left: 40px;">

* <details><summary style="margin-left: 20px;">dokai:21.11-tensor-stream</summary>
    
    [ghcr.io/osai-ai/dokai:21.11-tensor-stream](https://github.com/osai-ai/dokai/pkgs/container/dokai/10097674?tag=21.11-tensor-stream)
    
    additionally to `dokai:21.11-pytorch`:
    
    tensor-stream==0.4.6 (source, dev branch)
    
    </details>

* <details><summary>dokai:21.09-tensor-stream</summary>

    [ghcr.io/osai-ai/dokai:21.09-tensor-stream](https://github.com/osai-ai/dokai/pkgs/container/dokai/8319006?tag=21.09-tensor-stream)
    
    additionally to `dokai:21.09-pytorch`:
    
    tensor-stream==0.4.6 (source, dev branch)

    </details>

* <details><summary>dokai:21.08-tensor-stream</summary>

    [ghcr.io/osai-ai/dokai:21.08-tensor-stream](https://github.com/osai-ai/dokai/pkgs/container/dokai/6484817)

    additionally to `dokai:21.08-pytorch`:

    tensor-stream==0.4.6 (source, dev branch)

    </details>

* <details><summary>dokai:21.07-tensor-stream</summary>

    [ghcr.io/osai-ai/dokai:21.07-tensor-stream](https://github.com/osai-ai/dokai/pkgs/container/dokai/3600595)

    additionally to `dokai:21.07-pytorch`:

    tensor-stream==0.4.6 (source, dev branch)

    </details>

* <details><summary>dokai:21.05-tensor-stream</summary>

    [ghcr.io/osai-ai/dokai:21.05-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/2467549?tag=21.05-tensor-stream)

    additionally to `dokai:21.05-pytorch`:

    tensor-stream==0.4.6 (source, dev branch)

    </details>

* <details><summary>dokai:21.03-tensor-stream</summary>

    [ghcr.io/osai-ai/dokai:21.03-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/1661648)

    additionally to `dokai:21.03-pytorch`:

    tensor-stream==0.4.6 (source, dev branch)

    </details>

* <details><summary>dokai:21.02-tensor-stream</summary>

    [ghcr.io/osai-ai/dokai:21.02-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/1242107)

    additionally to `dokai:21.02-pytorch`:

    tensor-stream==0.4.6 (source, dev branch)

    </details>

* <details><summary>dokai:21.01-tensor-stream</summary>

    [ghcr.io/osai-ai/dokai:21.01-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/858272)

    additionally to `dokai:21.01-pytorch`:

    tensor-stream==0.4.6 (source, dev branch)

    </details>

* <details><summary>dokai:20.12-tensor-stream</summary>

    [ghcr.io/osai-ai/dokai:20.12-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/623510)

    additionally to `dokai:20.12-pytorch`:

    tensor-stream==0.4.6 (source, dev branch)

    </details>

* <details><summary>dokai:20.10-tensor-stream</summary>

    [ghcr.io/osai-ai/dokai:20.10-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/176389)

    additionally to `dokai:20.10-pytorch`:

    tensor-stream==0.4.6 (dev)

    </details>

* <details><summary>dokai:20.09-tensor-stream</summary>

    [ghcr.io/osai-ai/dokai:20.09-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dokai/89200)

    additionally to `dokai:20.09-pytorch`:

    tensor-stream==0.4.6 (dev)

    </details>

</div>
</details>


### vpf
<!---
==================================== VPF ====================================
-->

<details><summary style="margin-left: 20px;">dokai:23.05-vpf</summary>
<div style="margin-left: 20px;">

[ghcr.io/osai-ai/dokai:23.05-vpf](https://github.com/osai-ai/dokai/pkgs/container/dokai/93955272?tag=23.05-vpf)

additionally to `dokai:23.05-pytorch`:

VideoProcessingFramework (source, v2.0.0 tag)

</div>
</details>
