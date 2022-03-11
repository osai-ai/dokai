NAME?=dokai
COMMAND?=bash

GPUS?=all
ifeq ($(GPUS),none)
	GPUS_OPTION=
else
	GPUS_OPTION=--gpus=$(GPUS)
endif

.PHONY: all
all: stop build run

.PHONY: build-base
build-base:
	docker build -f ./docker/Dockerfile.base -t $(NAME):base .

.PHONY: build-pytorch
build-pytorch:
	docker build -f ./docker/Dockerfile.pytorch -t $(NAME):pytorch .

.PHONY: build-tensor-stream
build-tensor-stream:
	docker build -f ./docker/Dockerfile.tensor-stream -t $(NAME):tensor-stream .

.PHONY: build
build: build-base build-pytorch build-tensor-stream

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
		$(NAME):tensor-stream \
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
		$(NAME):tensor-stream \
		pytest --cov=tests
