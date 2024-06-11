define docker_image_size
	printf "$(NAME):$(1).$(2)$(3): " ; \
	docker inspect -f "{{ .Size }}" $(NAME):$(1).$(2)$(3) | numfmt --to=si
endef

.PHONY: inspect-sizes
inspect-sizes:		## Inspects docker images sizes and prints them out
	for TYPE in core ffmpeg base ; do \
		$(call docker_image_size,cpu,$$TYPE,) ; \
	done ; \
	for OPT in "" ".opt" ; do \
		for TYPE in core ffmpeg base pytorch video ; do \
			$(call docker_image_size,gpu,$$TYPE,$$OPT) ; \
		done \
  	done
