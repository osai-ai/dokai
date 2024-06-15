NAME?=dokai
COMMAND?=bash

TAG?=gpu.video.rootless
UNAME?=dokai
VERSION?=24.04

GPUS?=all
ifeq ($(GPUS),none)
	GPUS_OPTION=
else
	GPUS_OPTION=--gpus=$(GPUS)
endif

include scripts/make/attach.mk
include scripts/make/build.mk
include scripts/make/inspect.mk
include scripts/make/push.mk
include scripts/make/run.mk
include scripts/make/stop.mk
include scripts/make/tests.mk


.PHONY: all
all: stop build test run


.PHONY: help
help:  ## Show help
	@grep -hE '^[A-Za-z0-9_ \-]*?:.*##.*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

#/usr/local/nvidia/lib:/usr/local/nvidia/lib64:/home/dokai/.local/lib/x86_64-linux-gnu:/usr/local/cuda-12.2/compat
#/usr/local/nvidia/lib:/usr/local/nvidia/lib64:/usr/lib/x86_64-linux-gnu:/usr/local/cuda-12.2/compat
