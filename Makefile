NAME?=dokai
TAG?=vpf
COMMAND?=bash

GPUS?=all
ifeq ($(GPUS),none)
	GPUS_OPTION=
else
	GPUS_OPTION=--gpus=$(GPUS)
endif

.PHONY: all
all: stop build run

define docker_build
	docker build -f ./docker/Dockerfile.$(1) -t $(NAME):$(1) . 2>&1 | tee logs/build_$(1).log
endef

.PHONY: build
build:
	$(call docker_build,slim)
	$(call docker_build,base)
	$(call docker_build,pytorch)
	$(call docker_build,vpf)

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
