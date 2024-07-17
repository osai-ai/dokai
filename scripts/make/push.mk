# 1 - osaiai / ghcr.io/osai-ai
# 2 - gpu / cpu
# 3 - core / ffmpeg / base / pytorch / video
# 4 - "" / ".opt"
# 5 - "" / ".rootless"
define docker_push
	docker tag "$(NAME):$(2).$(3)$(4)$(5)" "$(1)/$(NAME):$(VERSION)-$(2).$(3)$(4)$(5)" ; \
	docker push "$(1)/$(NAME):$(VERSION)-$(2).$(3)$(4)$(5)"
endef

.PHONY: push
push:		## Pushes all built Dokai images to the Github and Docker Hub registries
	for REGISTRY in $(REGISTRIES) ; do \
		for ROOTLESS in "" ".rootless" ; do \
			for NAME in core ffmpeg base pytorch ; do \
				$(call docker_push,$$REGISTRY,cpu,$$NAME,,$$ROOTLESS) ; \
			done ; \
			for OPT in "" ".opt" ; do \
				for NAME in $(GPU_IMAGES) ; do \
					$(call docker_push,$$REGISTRY,gpu,$$NAME,$$OPT,$$ROOTLESS) ; \
				done ; \
			done ; \
		done ; \
	done
