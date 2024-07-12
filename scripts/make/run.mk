.PHONY: run
run:		## Runs docker container in an interactive mode
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd):/root/workdir \
		--workdir=/root/workdir \
		--name=$(NAME) \
		$(NAME):$(TAG) \
		$(COMMAND)

.PHONY: run-rootless
run-rootless:		## Runs rootless docker container in an interactive mode
	docker run --rm -it \
		$(GPUS_OPTION) \
		--user=$(UID):$(GID) \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--workdir=/home/$(UNAME)/workdir \
		--name=$(NAME) \
		$(NAME):$(TAG) \
		$(COMMAND)
