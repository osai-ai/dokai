.PHONY: run
run:		## Runs docker container in an interactive mode
	docker run --rm -dit \
		$(GPUS_OPTION) \
		--net=host \
		--ipc=host \
		-v $(shell pwd):/workdir \
		--name=$(NAME) \
		$(NAME):$(TAG) \
		$(COMMAND)
	docker attach $(NAME)
