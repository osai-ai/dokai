define docker_test
	docker run --rm -it \
		-v $(shell pwd):$(if $(filter $(3),rootless),/root/workdir,/home/$UNAME/workdir) \
		--workdir=$(if $(filter $(3),rootless),/root/workdir,/home/$UNAME/workdir) \
		--name=$(NAME) \
		$(NAME):$(1).$(2)$(if $(filter $(3),rootless),,.rootless) \
		/bin/bash -c "$(if $(filter $(2),core ffmpeg),,pip install pytest && )python -m pytest -v -m '$(1) and $(2) and $(3)'"
endef

.PHONY: test-cpu
test-cpu:		## Test CPU-based set of Docker images
	for NAME in core ffmpeg base pytorch ; do \
	  $(call docker_test,cpu,$$NAME,rootful) ; \
	done

.PHONY: test-cpu.rootless
test-cpu.rootless:		## Test rootless CPU-based set of Docker images
	for NAME in core ffmpeg base pytorch ; do \
	  $(call docker_test,cpu,$$NAME,rootless) ; \
	done

.PHONY: test-gpu
test-gpu:		## Test GPU-based set of Docker images
	for NAME in core ffmpeg base pytorch video ; do \
	  $(call docker_test,gpu,$$NAME,rootful) ; \
	done

.PHONY: test-gpu.rootless
test-gpu.rootless:		## Test rootless GPU-based set of Docker images
	for NAME in core ffmpeg base pytorch video ; do \
	  $(call docker_test,gpu,$$NAME,rootless) ; \
	done

.PHONY: test-gpu.opt
test-gpu.opt:	## Test optimized GPU-based set of Docker images
	for NAME in core ffmpeg base pytorch video ; do \
	  $(call docker_test,gpu,$$NAME.opt,rootful) ; \
	done

.PHONY: test-gpu.opt.rootless
test-gpu.opt.rootless:	## Test rootless optimized GPU-based set of Docker images
	for NAME in core ffmpeg base pytorch video ; do \
	  $(call docker_test,gpu,$$NAME.opt,rootless) ; \
	done

.PHONY: test
test:		## Test all Docker images
	make test-cpu
	make test-cpu.rootless
	make test-gpu
	make test-gpu.rootless
	make test-gpu.opt
	make test-gpu.opt.rootless
