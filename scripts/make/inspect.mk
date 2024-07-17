# 1 - gpu / cpu
# 2 - core / ffmpeg / base / pytorch / video
# 3 - "" / ".opt"
# 4 - "" / ".rootless"
define docker_image_size
	printf "$(NAME):$(1).$(2)$(3)$(4)$(5): " ; \
	docker inspect -f "{{ .Size }}" $(NAME):$(1).$(2)$(3)$(4) | numfmt --to=si
endef

# 1 - osaiai / ghcr.io/osai-ai
# 2 - gpu / cpu
# 3 - core / ffmpeg / base / pytorch / video
# 4 - "" / ".opt"
# 5 - "" / ".rootless"
define docker_image_download_time
	docker rmi $(1)/$(NAME):$(VERSION)-$(2).$(3)$(4)$(5) -f > /dev/null 2> /dev/null ; \
	printf "$(1)/$(NAME):$(VERSION)-$(2).$(3)$(4)$(5): " >> result.txt ; \
	time --format="%E" --output=tmp.txt docker pull $(1)/$(NAME):$(VERSION)-$(2).$(3)$(4)$(5) -q ; \
	cat tmp.txt >> result.txt ; \
	rm -f tmp.txt ; \
	docker rmi $(1)/$(NAME):$(VERSION)-$(2).$(3)$(4)$(5) -f > /dev/null 2> /dev/null
endef

.PHONY: inspect-sizes
inspect-sizes:		## Inspects docker images sizes and prints them out
	for NAME in $(CPU_IMAGES) ; do \
		for ROOTLESS in "" ".rootless" ; do \
			$(call docker_image_size,cpu,$$NAME,,$$ROOTLESS) ; \
		done ; \
	done ; \
	for OPT in "" ".opt" ; do \
		for NAME in $(GPU_IMAGES) ; do \
			for ROOTLESS in "" ".rootless" ; do \
				$(call docker_image_size,gpu,$$NAME,$$OPT,$$ROOTLESS) ; \
			done ; \
		done \
  	done

.PHONE: inspect-time
inspect-time:		## Inspects docker images download time and prints them out
	rm -f result.txt ; \
	for REGISTRY in $(REGISTRIES) ; do \
		for ROOTLESS in "" ".rootless" ; do \
			for NAME in $(CPU_IMAGES) ; do \
				$(call docker_image_download_time,$$REGISTRY,cpu,$$NAME,,$$ROOTLESS) ; \
			done ; \
			for OPT in "" ".opt" ; do \
				for NAME in $(GPU_IMAGES) ; do \
					$(call docker_image_download_time,$$REGISTRY,gpu,$$NAME,$$OPT,$$ROOTLESS) ; \
				done ; \
			done ; \
		done ; \
	done
