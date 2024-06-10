define docker_push
	docker tag "dokai:$(2).$(3)$(4)" "$(1):$(VERSION)-$(2).$(3)$(4)" ; \
	docker push "$(1):$(VERSION)-$(2).$(3)$(4)"
endef

.PHONY: push
push:		## Pushes all built Dokai images to the Github and Docker Hub registries
	for REGISTRY in "osaiai/dokai" "ghcr.io/osai-ai/dokai" ; do \
		for TYPE in core ffmpeg base ; do \
			$(call docker_push,$$REGISTRY,cpu,$$TYPE,) ; \
		done ; \
		for OPT in "" ".opt" ; do \
			for TYPE in core ffmpeg base pytorch video ; do \
				$(call docker_push,$$REGISTRY,gpu,$$TYPE,$$OPT) ; \
			done ; \
		done ; \
	done
