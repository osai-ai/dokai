# 1 - gpu / cpu
# 2 - core / ffmpeg / base / pytorch / video
# 3 - "" / ".opt"
define docker_build
	docker build \
		-f ./docker/root/$(1)/$(if $(3),optimized/,)Dockerfile.$(1).$(2)$(3) \
		-t $(NAME):$(1).$(2)$(3) . 2>&1 | tee logs/build_$(1).$(2)$(3).log
endef

define docker_build_rootless
	docker build \
		-f ./docker/rootless/$(1)/$(if $(3),optimized/,)Dockerfile.$(1).$(2)$(3).rootless \
		-t $(NAME):$(1).$(2)$(3).rootless . 2>&1 | tee logs/build_$(1).$(2)$(3).rootless.log
endef

.PHONY: build-cpu
build-cpu:		## Build CPU-based set of Docker images
	for NAME in core ffmpeg base pytorch ; do \
	  $(call docker_build,cpu,$$NAME,) ; \
	done

.PHONY: build-cpu.rootless
build-cpu.rootless:		## Build rootless CPU-based set of Docker images
	for NAME in core ffmpeg base pytorch ; do \
	  $(call docker_build_rootless,cpu,$$NAME,) ; \
	done

.PHONY: build-gpu
build-gpu:		## Build GPU-based set of Docker images
	for NAME in core ffmpeg base pytorch video ; do \
	  $(call docker_build,gpu,$$NAME,) ; \
	done

.PHONY: build-gpu.rootless
build-gpu.rootless:		## Build rootless GPU-based set of Docker images
	for NAME in core ffmpeg base pytorch video ; do \
	  $(call docker_build_rootless,gpu,$$NAME,) ; \
	done

.PHONY: build-gpu.opt
build-gpu.opt:		## Build GPU-based optimized set of Docker images
	for NAME in core ffmpeg base pytorch video ; do \
	  $(call docker_build,gpu,$$NAME,.opt) ; \
	done

.PHONY: build-gpu.opt.rootless
build-gpu.opt.rootless:		## Build rootless GPU-based optimized set of Docker images
	for NAME in core ffmpeg base pytorch video ; do \
	  $(call docker_build_rootless,gpu,$$NAME,.opt) ; \
	done

.PHONY: build
build:		## Build all Docker images
	make build-cpu
	make build-cpu.rootless
	make build-gpu
	make build-gpu.rootless
	make build-gpu-opt
	make build-gpu-opt.rootless
