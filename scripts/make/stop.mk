.PHONY: stop
stop:		## Stops docker container
	-docker stop $(NAME)
	-docker rm $(NAME)
