.PHONY: run
run:		## Runs docker container in an interactive mode
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--workdir=/home/$(UNAME)/workdir \
		--name=$(NAME) \
		$(NAME):$(TAG) \
		$(COMMAND)
