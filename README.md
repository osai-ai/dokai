![dokai-logo](https://raw.githubusercontent.com/osai-ai/dokai/master/pics/dokai-logo.png)

Collection of Docker images for ML/DL and video processing projects.

## Overview of images

Several types of images are presented:

* `core`: CUDA (12.2.2), cuDNN (8.9.6), Python (3.11.7)
* `base`: Python ML and CV packages, FFmpeg (6.1) with NVENC/NVDEC support
* `pytorch`: TensorRT (9.2.0), PyTorch (2.1.2), torchvision (0.16.2), torchaudio (2.1.2) and torch based libraries
* `video`: VideoProcessingFramework (2.0.0) and Tensor Stream (0.5.0) for full HW acceleration of video decoding 

Supported NVIDIA architectures: Pascal (sm_60, sm_61), Volta (sm_70), Turing (sm_75), Ampere (sm_80, sm_86), Ada Lovelace (sm_89), Hopper (sm_90).  
You can identify the architecture of your GPU [here](https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/).

## Example

Pull an image from the GitHub Container registry
```bash
docker pull ghcr.io/osai-ai/dokai:23.12-pytorch
```

Docker Hub [mirror](https://hub.docker.com/r/osaiai/dokai/tags)
```bash
docker pull osaiai/dokai:23.12-pytorch
```

Check available GPUs inside the container
```bash
docker run --rm \
    --gpus=all \
    ghcr.io/osai-ai/dokai:23.12-pytorch \
    nvidia-smi
```

## Package versions

<details><summary>dokai:23.12-core</summary>
<p>

[ghcr.io/osai-ai/dokai:23.12-core](https://github.com/osai-ai/dokai/pkgs/container/dokai/160087553?tag=23.12-core)

CUDA (12.2.2), cuDNN (8.9.6)  
CMake (3.22.1)  
Python (3.11.7)  

pip==23.3.2  
setuptools==69.0.2

</p>
</details>

<details><summary>dokai:23.12-base</summary>
<p>

[ghcr.io/osai-ai/dokai:23.12-base](https://github.com/osai-ai/dokai/pkgs/container/dokai/160090648?tag=23.12-base)

additionally to `dokai:23.12-core`:

FFmpeg (n6.1), nv-codec-headers (n12.1.14.0)  

packaging==23.2   
numpy==1.26.2   
opencv-python==4.8.1.78   
sympy==1.12   
scipy==1.11.4   
matplotlib==3.8.2   
pandas==2.1.4   
scikit-learn==1.3.2   
scikit-image==0.22.0   
Pillow==10.1.0   
av==11.0.0   
librosa==0.10.1   
albumentations==1.3.1   
pyzmq==25.1.2   
Cython==3.0.6   
numba==0.58.1   
requests==2.31.0   
psutil==5.9.7   
pydantic==2.5.2   
PyYAML==6.0.1   
notebook==7.0.6   
ipywidgets==8.1.1   
tqdm==4.66.1   
pytest==7.4.3   
pytest-cov==4.1.0   
mypy==1.7.1   
flake8==6.1.0   
pre-commit==3.6.0  

</p>
</details>

<details><summary>dokai:23.12-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:23.12-pytorch](https://github.com/osai-ai/dokai/pkgs/container/dokai/160107248?tag=23.12-pytorch)

additionally to `dokai:23.12-base`:

TensorRT (9.2.0)  
MAGMA (2.7.1)  

torch==2.1.2 (source, v2.1.2)  
torchvision==0.16.2 (source, v0.16.2)  
torchaudio==2.1.2 (source, v2.1.2)  
triton==2.1.0   
cupy-cuda12x==12.3.0   
pytorch-ignite==0.4.13   
pytorch-argus==1.0.0   
kornia==0.7.0   
timm==0.9.12   
onnx==1.15.0   
onnxruntime==1.16.3   
onnxsim==0.4.35  

</p>
</details>

<details><summary>dokai:23.12-video</summary>
<p>

[ghcr.io/osai-ai/dokai:23.12-video](https://github.com/osai-ai/dokai/pkgs/container/dokai/160107462?tag=23.12-video)

additionally to `dokai:23.12-pytorch`:

VideoProcessingFramework==2.0.0 (source, v2.0.0)  
tensor-stream==0.5.0 (source, 0.5.0)

</p>
</details>

Versions for past releases can be found in [release descriptions](https://github.com/osai-ai/dokai/releases).
