REGISTRY?=ghcr.io/osai-ai/dokai
TAG?=23.12-pytorch
PRECISION?=float16
RESULT_PREFIX?=benchmark

BENCHMARK_NAME=$(shell basename $(REGISTRY)):$(TAG)

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
		-t $(BENCHMARK_NAME) .

.PHONY: run
run:		## Runs docker container in an interactive mode
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd):/root/workdir \
		--workdir=/root/workdir \
		--name=dokai-benchmark \
		$(BENCHMARK_NAME) \
		bash

.PHONY: run-benchmark
run-benchmark:
	docker run --rm \
		$(GPUS_OPTION) \
		-v $(shell pwd)/results:/results \
		-v $(shell pwd)/model_list.txt:/model_list.txt \
		--name=dokai-benchmark \
		$(BENCHMARK_NAME) \
		python pytorch-image-models/benchmark.py \
		--model-list /model_list.txt \
		--precision $(PRECISION) \
		--results-file "/results/$(RESULT_PREFIX)_$(PRECISION)_$(BENCHMARK_NAME).csv"
