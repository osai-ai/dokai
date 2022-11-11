REGISTRY?=ghcr.io/osai-ai/dokai
TAG?=dev-pytorch
IMAGE_NAME?=dokai-benchmark
OPTIONS?=

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
		$(OPTIONS) \
		$(GPUS_OPTION) \
		--ipc=host \
		--name=$(IMAGE_NAME)-$(TAG) \
		$(IMAGE_NAME):$(TAG)
