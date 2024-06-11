.PHONY: attach
attach:		## Attach to the docker container
	docker attach $(NAME)
