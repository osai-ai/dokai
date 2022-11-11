ARG REGISTRY
ARG TAG
FROM $REGISTRY:$TAG

RUN git clone --depth=1 --branch=v0.6.11 --single-branch https://github.com/rwightman/pytorch-image-models.git

CMD ["python", "pytorch-image-models/benchmark.py"]
