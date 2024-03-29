![dokai-logo](https://raw.githubusercontent.com/osai-ai/dokai/master/pics/dokai-logo.png)

Collection of Docker images for ML/DL and video processing projects.

## Overview of images

Several types of images are presented:

* `core`: CUDA (12.2.2), cuDNN (8.9.6), Python (3.11.7)
* `ffmpeg`: FFmpeg (6.1) with NVENC/NVDEC support
* `base`: Python ML and CV packages listed [here](docker/requirements/requirements_base.txt)
* `pytorch`: TensorRT (9.2.0), PyTorch (2.1.2), torchvision (0.16.2), torchaudio (2.1.2) and torch based libraries listed [here](docker/requirements/requirements_pytorch.txt)
* `video`: VideoProcessingFramework (2.0.0) and Tensor Stream (0.5.0) for full HW acceleration of video decoding 

Supported NVIDIA architectures: Pascal (sm_60, sm_61), Volta (sm_70), Turing (sm_75), Ampere (sm_80, sm_86), Ada Lovelace (sm_89), Hopper (sm_90).  
You can identify the architecture of your GPU [here](https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/).

## Example

Pull an image from the GitHub Container registry
```bash
docker pull ghcr.io/osai-ai/dokai:24.03-pytorch
```

Docker Hub [mirror](https://hub.docker.com/r/osaiai/dokai/tags)
```bash
docker pull osaiai/dokai:24.03-pytorch
```

Check available GPUs inside the container
```bash
docker run --rm \
    --gpus=all \
    ghcr.io/osai-ai/dokai:24.03-pytorch \
    nvidia-smi
```

## Package versions

### Built from sources

<details><summary>dokai:24.03-core</summary>
<p>

[ghcr.io/osai-ai/dokai:24.03-core](https://github.com/osai-ai/dokai/pkgs/container/dokai/160087553?tag=24.03-core)

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

<details><summary>dokai:24.03-ffmpeg</summary>
<p>

[ghcr.io/osai-ai/dokai:24.03-ffmpeg](https://github.com/osai-ai/dokai/pkgs/container/dokai/160090648?tag=24.03-ffmpeg)

Image based on `ghcr.io/osai-ai/dokai:24.03-core`:

Additionally, installed:

- FFmpeg (n6.1)
- nv-codec-headers (n12.1.14.0)

</p>
</details>

<details><summary>dokai:24.03-base</summary>
<p>

[ghcr.io/osai-ai/dokai:24.03-base](https://github.com/osai-ai/dokai/pkgs/container/dokai/160090648?tag=24.03-base)

Image based on `ghcr.io/osai-ai/dokai:24.03-ffmpeg`:

Additionally, installed:

- Python ML and CV packages: [requirements.txt](./docker/requirements/requirements_base.txt)

</p>
</details>

<details><summary>dokai:24.03-pytorch</summary>
<p>

[ghcr.io/osai-ai/dokai:24.03-pytorch](https://github.com/osai-ai/dokai/pkgs/container/dokai/160107248?tag=24.03-pytorch)

Image based on `dokai:24.03-base`.

Additionally, installed:

- TensorRT (9.2.0)
- MAGMA (2.7.1)
- Pytorch-related packages: [requirements.txt](./docker/requirements/requirements_pytorch.txt)

</p>
</details>

<details><summary>dokai:24.03-video</summary>
<p>

[ghcr.io/osai-ai/dokai:24.03-video](https://github.com/osai-ai/dokai/pkgs/container/dokai/160107462?tag=24.03-video)

Image based on `dokai:24.03-pytorch`.

Additionally, installed:

- VideoProcessingFramework==2.0.0 (source, v2.0.0)  
- tensor-stream==0.5.0 (source, 0.5.0)

</p>
</details>

### Optimized

Initially this set is composed from the previous one but based on lighter NVIDIA `runtime` base image.  

<details><summary>dokai:24.03-core.opt</summary>
<p>

Image based on `nvidia/cuda:12.2.2-cudnn8-runtime-ubuntu22.04` and includes the same
additionally installed packages as `dokai:24.03-core`.

</p>
</details>


<details><summary>dokai:24.03-ffmpeg.opt</summary>
<p>

Image based on `dokai:24.03-core.opt`  and includes the same
additionally installed packages as `dokai:24.03-ffmpeg`.

</p>
</details>


<details><summary>dokai:24.03-base.opt</summary>
<p>

Image based on `dokai:24.03-ffmpeg.opt`  and includes the same
additionally installed packages as `dokai:24.03-base`.

</p>
</details>


<details><summary>dokai:24.03-pytorch.opt</summary>
<p>

Image based on `dokai:24.03-base.opt`  and includes the same
additionally installed packages as `dokai:24.03-pytorch`.

</p>
</details>


<details><summary>dokai:24.03-video.opt</summary>
<p>

Image based on `dokai:24.03-pytorch.opt`  and includes the same
additionally installed packages as `dokai:24.03-video`.

</p>
</details>

### Size comparison

Docker set |      | *.opt |
-------- |------|-------|
dokai:core | 11Gb | 4.5Gb |
dokai:ffmpeg | 11Gb | 4.6Gb |
dokai:base | 12Gb | 5.7Gb |
dokai:pytorch | 17Gb | 12Gb  |
dokai:video | 17Gb | 12Gb  |

Versions for past releases can be found in [release descriptions](https://github.com/osai-ai/dokai/releases).
