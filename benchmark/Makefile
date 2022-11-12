REGISTRY?=ghcr.io/osai-ai/dokai
TAG?=dev-pytorch
IMAGE_NAME?=dokai-benchmark
PRECISION?=float32
RESULT_PREFIX?=benchmark

GPUS?=all
ifeq ($(GPUS),none)
	GPUS_OPTION=
else
	GPUS_OPTION=--gpus=$(GPUS)
endif

.PHONY: all
all: build run-benchmark

.PHONY: build
build:
	docker build \
		--build-arg REGISTRY=$(REGISTRY) \
		--build-arg TAG=$(TAG) \
		-t $(IMAGE_NAME):$(TAG) .

.PHONY: run-benchmark
run-benchmark:
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd)/results:/results \
		-v $(shell pwd)/model_list.txt:/model_list.txt \
		--name=$(IMAGE_NAME)-$(TAG) \
		$(IMAGE_NAME):$(TAG) \
		python pytorch-image-models/benchmark.py \
		--model-list /model_list.txt \
		--precision $(PRECISION) \
		--results-file "/results/$(RESULT_PREFIX)_$(PRECISION)_$(shell basename $(REGISTRY)):$(TAG).csv"
