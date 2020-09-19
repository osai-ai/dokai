# Dockai

![Build and push Docker images](https://github.com/osai-ai/dockai/workflows/Build%20and%20push%20Docker%20images/badge.svg)

Collection of Docker images for ML/DL and video processing projects. 

## Overview of images

Three types of images differ by tag postfix:

* `base`: Python with ML and CV packages, CUDA, FFmpeg with NVENC support
* `pytorch`: PyTorch, torchvision and torch based libraries
* `tensor-stream`: Tensor Stream

## Example

Example of using dockai image for DL pipeline you can find [here](example).

## Versions 

### base

<details><summary>dockai:20.09-base</summary>
<p>

[ghcr.io/osai-ai/dockai:20.09-base](https://github.com/orgs/osai-ai/packages/container/dockai/63401)

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

### pytorch

<details><summary>dockai:20.09-pytorch</summary>
<p>

[ghcr.io/osai-ai/dockai:20.09-pytorch](https://github.com/orgs/osai-ai/packages/container/dockai/63402)

torch==1.6.0  
torchvision==0.7.0  
pytorch-argus==0.1.2  
timm==0.2.1  
apex (master)  

</p>
</details>


### tensor-stream

<details><summary>dockai:20.09-tensor-stream</summary>
<p>

[ghcr.io/osai-ai/dockai:20.09-tensor-stream](https://github.com/orgs/osai-ai/packages/container/dockai/63403)

tensor-stream==0.4.6 (dev)  

</p>
</details>
