![dokai-logo](https://raw.githubusercontent.com/osai-ai/dokai/master/pics/dokai-logo.png)

Collection of Docker images for ML/DL and video processing projects.

## Overview of images

Several types of images are presented:

* `core`: CUDA (12.2.2), cuDNN (8.9.5), Python (3.11.6)
* `base`: Python ML and CV packages, FFmpeg (6.0) with NVENC/NVDEC support
* `pytorch`: TensorRT (8.6.1), PyTorch (2.1.0), torchvision (0.16.0), torchaudio (2.1.0) and torch based libraries
* `video`: VideoProcessingFramework (2.0.0) and Tensor Stream (0.5.0) for full HW acceleration of video decoding 

Supported NVIDIA architectures: Pascal (sm_60, sm_61), Volta (sm_70), Turing (sm_75), Ampere (sm_80, sm_86), Ada Lovelace (sm_89), Hopper (sm_90).  
You can identify the architecture of your GPU [here](https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/).

## Example

Pull an image from GitHub Container registry
```Bash
docker pull ghcr.io/osai-ai/dokai:23.10-pytorch
```

Docker Hub [mirror](https://hub.docker.com/r/osaiai/dokai/tags)
```bash
docker pull osaiai/dokai:23.10-pytorch
```

Check available GPUs inside the container
```bash
docker run --rm \
    --gpus=all \
    ghcr.io/osai-ai/dokai:23.10-pytorch \
    nvidia-smi
```

An example of using dokai image for the DL pipeline can be found [here](https://github.com/osai-ai/dokai/tree/master/example).

## Package versions

<details><summary>dokai:23.10-core</summary>
<p>

[ghcr.io/osai-ai/dokai:23.10-core]()

CUDA (12.2.2), cuDNN (8.9.5)  
Python (3.11.6)

</p>
</details>

<details><summary>dokai:23.10-base</summary>
<p>

[ghcr.io/osai-ai/dokai:23.10-base]()

additionally to `dokai:23.10-core`:

FFmpeg (n6.0), nv-codec-headers (n12.1.14.0)  

packaging==23.2  
numpy==1.26.1  
opencv-python==4.8.1.78  
sympy==1.12  
scipy==1.11.3  
matplotlib==3.8.0  
pandas==2.1.1  
scikit-learn==1.3.2  
scikit-image==0.22.0  
Pillow==10.1.0  
av==10.0.0  
librosa==0.10.1  
albumentations==1.3.1  
pyzmq==25.1.1  
Cython==3.0.4  
numba==0.58.1  
requests==2.31.0  
psutil==5.9.6  
pydantic==2.4.2  
PyYAML==6.0.1  
notebook==7.0.6  
ipywidgets==8.1.1  
tqdm==4.66.1  
pytest==7.4.2  
pytest-cov==4.1.0  
mypy==1.6.1  
flake8==6.1.0  
pre-commit==3.5.0

</p>
</details>

<details><summary>dokai:23.10-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:23.10-pytorch]()

additionally to `dokai:23.10-base`:

TensorRT (8.6.1)  
MAGMA (2.7.1)  

torch==2.1.0 (source, v2.1.0)  
torch_tensorrt (source, v2.1.0-rc3)  
torchvision==0.16.0 (source, v0.16.0)  
torchaudio==2.1.0 (source, v2.1.0)  
triton==2.1.0    
cupy-cuda12x==12.2.0    
pytorch-ignite==0.4.13    
pytorch-argus==1.0.0    
kornia==0.7.0    
timm==0.9.8    
onnx==1.14.1    
onnxruntime==1.16.1    
onnxsim==0.4.35

</p>
</details>

<details><summary>dokai:23.10-video</summary>
<p>

[ghcr.io/osai-ai/dokai:23.10-video]()

additionally to `dokai:23.10-pytorch`:

VideoProcessingFramework==2.0.0 (source, v2.0.0)  
tensor-stream==0.5.0 (source, 0.5.0)

</p>
</details>
