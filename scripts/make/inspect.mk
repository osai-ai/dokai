define docker_image_size
	printf "$(NAME):$(1).$(2)$(3)$(4): " ; \
	docker inspect -f "{{ .Size }}" $(NAME):$(1).$(2)$(3)$(4) | numfmt --to=si
endef

.PHONY: inspect-sizes
inspect-sizes:		## Inspects docker images sizes and prints them out
	for TYPE in core ffmpeg base pytorch ; do \
		for ROOTLESS in "" ".rootless" ; do \
			$(call docker_image_size,cpu,$$TYPE,,$$ROOTLESS) ; \
		done ; \
	done ; \
	for OPT in "" ".opt" ; do \
		for TYPE in core ffmpeg base pytorch video ; do \
			for ROOTLESS in "" ".rootless" ; do \
				$(call docker_image_size,gpu,$$TYPE,$$OPT,$$ROOTLESS) ; \
			done ; \
		done \
  	done
