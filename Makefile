NAME?=dokai
LABEL?=
TAG?=video$(LABEL)
COMMAND?=bash

REGISTRY?=osaiai/dokai
VERSION?=24.03

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
		./docker/$(if $(LABEL),optimized/,source/)Dockerfile.$(1)$(LABEL) \
		-t $(NAME):$(1)$(LABEL) . 2>&1 | tee logs/build_$(1)${LABEL}.log
endef

define docker_image_size
	docker inspect -f "{{ .Size }}" $(NAME):$(1)$(LABEL) | numfmt --to=si
endef

.PHONY: build
build:
	$(call docker_build,core)
	$(call docker_build,base)
	$(call docker_build,pytorch)
	$(call docker_build,video)

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
	$(call docker_image_size,core) && \
	$(call docker_image_size,base) && \
	$(call docker_image_size,pytorch) && \
	$(call docker_image_size,video)

.PHONY: push
push:
	for TYPE in core base pytorch video ; do \
	  docker tag "dokai:$$TYPE$(LABEL)" "$(REGISTRY):$(VERSION)-$$TYPE$(LABEL)" ; \
	  docker push "$(REGISTRY):$(VERSION)-$$TYPE$(LABEL)" ; \
	done