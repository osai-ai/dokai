NAME?=dokai
COMMAND?=bash

TAG?=gpu.video.opt

# Should be `osaiai/dokai` or `ghcr.io/osai-ai/dokai`
REGISTRY?=osaiai/dokai

VERSION?=24.04

GPUS?=all
ifeq ($(GPUS),none)
	GPUS_OPTION=
else
	GPUS_OPTION=--gpus=$(GPUS)
endif

.PHONY: all
all: stop build run

define docker_build
	docker build -f \
		./docker/$(1)/$(if $(3),optimized/,)Dockerfile.$(1).$(2)$(3) \
		-t $(NAME):$(1).$(2)$(3) . 2>&1 | tee logs/build_$(1).$(2)$(3).log
endef

define docker_image_size
	printf "$(NAME):$(1).$(2)$(3): " ; \
	docker inspect -f "{{ .Size }}" $(NAME):$(1).$(2)$(3) | numfmt --to=si
endef

define docker_push
	docker tag "dokai:$(2).$(3)$(4)" "$(1):$(VERSION)-$(2).$(3)$(4)" ; \
	docker push "$(1):$(VERSION)-$(2).$(3)$(4)"
endef

.PHONY: build-cpu
build-cpu:
	for NAME in core ffmpeg base ; do \
	  $(call docker_build,cpu,$$NAME,) ; \
	done

.PHONY: build-gpu
build-gpu:
	for NAME in core ffmpeg base pytorch video ; do \
	  $(call docker_build,gpu,$$NAME,) ; \
	done

.PHONY: build-gpu-opt
build-gpu-opt:
	for NAME in core ffmpeg base pytorch video ; do \
	  $(call docker_build,gpu,$$NAME,.opt) ; \
	done

.PHONY: build
build: build-cpu build-gpu build-gpu-opt

.PHONY: stop
stop:
	-docker stop $(NAME)
	-docker rm $(NAME)

.PHONY: run
run:
	docker run --rm -dit \
		$(GPUS_OPTION) \
		--net=host \
		--ipc=host \
		-v $(shell pwd):/workdir \
		--name=$(NAME) \
		$(NAME):$(TAG) \
		$(COMMAND)
	docker attach $(NAME)

.PHONY: attach
attach:
	docker attach $(NAME)

.PHONY: logs
logs:
	docker logs -f $(NAME)

.PHONY: exec
exec:
	docker exec -it $(NAME) $(COMMAND)

.PHONY: test
test:
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd):/workdir \
		--name=$(NAME) \
		$(NAME):$(TAG) \
		pytest --cov=tests

.PHONY: inspect
inspect:
	for TYPE in core ffmpeg base ; do \
		$(call docker_image_size,cpu,$$TYPE,) ; \
	done ; \
	for OPT in "" ".opt" ; do \
		for TYPE in core ffmpeg base pytorch video ; do \
			$(call docker_image_size,gpu,$$TYPE,$$OPT) ; \
		done \
  	done

.PHONY: push
push:
	for REGISTRY in "osaiai/dokai" "ghcr.io/osai-ai/dokai" ; do \
		for TYPE in core ffmpeg base ; do \
			$(call docker_push,$$REGISTRY,cpu,$$TYPE,) ; \
		done ; \
		for OPT in "" ".opt" ; do \
			for TYPE in core ffmpeg base pytorch video ; do \
				$(call docker_push,$$REGISTRY,gpu,$$TYPE,$$OPT) ; \
			done ; \
		done ; \
	done
