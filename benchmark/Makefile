REGISTRY?=ghcr.io/osai-ai/dokai
TAG?=22.11-pytorch
PRECISION?=float32
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
