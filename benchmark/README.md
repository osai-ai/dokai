# PyTorch image models benchmark

Run an inference and train step benchmark script from [timm](https://github.com/rwightman/pytorch-image-models/blob/main/benchmark.py).
```bash
make
```

Specify docker image name, precision (float32, float16), or prefix for result file name.
```bash
make REGISTRY=osaiai/dokai TAG=22.11-pytorch PRECISION=float16 RESULT_PREFIX=2080Ti GPUS='\"device=0\"'
```
The result `.csv` file will be saved in `./results/2080Ti_float16_dokai:22.11-pytorch.csv`.

You can benchmark not only dokai images. For example images from [NGC](https://catalog.ngc.nvidia.com/):
```bash
make REGISTRY=nvcr.io/nvidia/pytorch TAG=22.10-py3
```
