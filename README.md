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

### Docker images built from sources

<details><summary>dokai:23.12-core</summary>
<p>

[ghcr.io/osai-ai/dokai:23.12-core](https://github.com/osai-ai/dokai/pkgs/container/dokai/160087553?tag=23.12-core)

Image based on `nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04` which includes:

- Ubuntu 22.04 Operational System;
- CUDA (12.2.2);
- cuDNN (8.9.6);
- NVCC;
- etc..

On top of that packages are installed, here's a brief description and purpose of each:

**Python (3.11.8):**
- **python3.11** is a programming language used for scripting and software development.
- **python3.11-dev** contains header files and development tools for building Python extensions.
- **python3.11-distutils** contains utilities for distributing and installing Python packages.
- **python3.11-tk** contains Tkinter, a GUI toolkit for Python.

**Builders, configurators and compilers:**
- **build-essential** package contains essential tools required for building software on Ubuntu, including compilers (gcc, g++, etc.) and build-related tools.
- **Yasm and nasm** are assemblers used for compiling assembly language code into machine-readable format, commonly used in building software.
- **Ninja** is a small build system that is fast and efficient, used as an alternative to GNU Make in some projects.
- **cmake** is a cross-platform build system generator used to control the software compilation process using simple platform-independent configuration files.
- **pkgconf** is a package configuration system used to help locate and configure libraries needed for building software.
- **gfortran** is a GNU Fortran compiler used for compiling Fortran code.
- **autoconf and libtool** are tools for generating configure scripts and managing software builds on various platforms.

**Utilities:**
- **nano, vim, tmux** are text editors and terminal multiplexers used for editing files and managing terminal sessions.
- **unzip** is a utility used to decompress ZIP archives, commonly used for extracting files from compressed archives.
- **git** is a distributed version control system used for tracking changes in source code during software development.
- **wget, curl** are command-line tools used for downloading files from the internet, commonly used in scripts and automation tasks.
- **htop and nvtop** are interactive system monitoring tools used for displaying system resource usage.
- **sysstat** collects and reports system performance statistics, including CPU, memory, and disk usage.

**Libraries:**
- **libsm6, libxext6, libxrender1, libgl1-mesa-glx** libraries for X Window System used for rendering graphics and managing graphical applications.
- **libtcmalloc-minimal4** is a memory allocation library, providing optimized memory management functions.
- **libx264-dev** is a library for encoding H.264 video streams.
- **libsndfile1** is a library for reading and writing audio files.
- **libssl-dev** is a development package for OpenSSL, providing cryptographic functions.
- **libpng-dev and libjpeg-dev** are development libraries for handling PNG and JPEG image formats, respectively.
- **libmp3lame-dev** is a development library for encoding and decoding MP3 audio files.
- **liblapack-dev** is a library for numerical linear algebra functions.
- **libopenblas-dev** is an optimized BLAS (Basic Linear Algebra Subprograms) library.

</p>
</details>

<details><summary>dokai:23.12-base</summary>
<p>

[ghcr.io/osai-ai/dokai:23.12-base](https://github.com/osai-ai/dokai/pkgs/container/dokai/160090648?tag=23.12-base)

Image based on `ghcr.io/osai-ai/dokai:23.12-core`:

Additionally, installed:

- FFmpeg (n6.1)
- nv-codec-headers (n12.1.14.0)
- python packages:
  - packaging==23.2
  - numpy==1.26.2
  - opencv-python==4.8.1.78
  - sympy==1.12
  - scipy==1.11.4
  - matplotlib==3.8.2
  - pandas==2.1.4
  - scikit-learn==1.3.2
  - scikit-image==0.22.0
  - Pillow==10.1.0   
  - av==11.0.0   
  - librosa==0.10.1   
  - albumentations==1.3.1   
  - pyzmq==25.1.2   
  - Cython==3.0.6   
  - numba==0.58.1   
  - requests==2.31.0   
  - psutil==5.9.7   
  - pydantic==2.5.2   
  - PyYAML==6.0.1   
  - notebook==7.0.6   
  - ipywidgets==8.1.1   
  - tqdm==4.66.1   
  - pytest==7.4.3   
  - pytest-cov==4.1.0   
  - mypy==1.7.1   
  - flake8==6.1.0   
  - pre-commit==3.6.0  

</p>
</details>

<details><summary>dokai:23.12-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:23.12-pytorch](https://github.com/osai-ai/dokai/pkgs/container/dokai/160107248?tag=23.12-pytorch)

Image based on `ghcr.io/osai-ai/dokai:23.12-base`:

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

### Docker images optimised

Versions for past releases can be found in [release descriptions](https://github.com/osai-ai/dokai/releases).
