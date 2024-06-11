define docker_build
	docker build -f \
		./docker/$(1)/$(if $(3),optimized/,)Dockerfile.$(1).$(2)$(3) \
		-t $(NAME):$(1).$(2)$(3) . 2>&1 | tee logs/build_$(1).$(2)$(3).log
endef

.PHONY: build-cpu
build-cpu:		## Build CPU Docker images defined
	for NAME in core ffmpeg base ; do \
	  $(call docker_build,cpu,$$NAME,) ; \
	done

.PHONY: build-gpu
build-gpu:		## Build GPU Docker images defined
	for NAME in core ffmpeg base pytorch video ; do \
	  $(call docker_build,gpu,$$NAME,) ; \
	done

.PHONY: build-gpu-opt
build-gpu-opt:		## Build GPU Optimized Docker images
	for NAME in core ffmpeg base pytorch video ; do \
	  $(call docker_build,gpu,$$NAME,.opt) ; \
	done

.PHONY: build
build:		## Build all Docker images
	make build-cpu
	make build-gpu
	make build-gpu-opt
