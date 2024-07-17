.PHONY: prune-cpu
prune-cpu:		## Prune CPU-based set of Docker images
	for NAME in core ffmpeg base pytorch ; do \
	  docker image rm $(NAME):cpu.$$NAME ; \
	done

.PHONY: prune-cpu.rootless
prune-cpu.rootless:		## Prune rootless CPU-based set of Docker images
	for NAME in core ffmpeg base pytorch ; do \
	  docker image rm $(NAME):cpu.$$NAME.rootless ; \
	done

.PHONY: prune-gpu
prune-gpu:		## Prune GPU-based set of Docker images
	for NAME in $(GPU_IMAGES) ; do \
	  docker image rm $(NAME):gpu.$$NAME ; \
	done

.PHONY: prune-gpu.rootless
prune-gpu.rootless:		## Prune rootless GPU-based set of Docker images
	for NAME in $(GPU_IMAGES) ; do \
	  docker image rm $(NAME):gpu.$$NAME.rootless ; \
	done

.PHONY: prune-gpu.opt
prune-gpu.opt:		## Prune GPU-based optimized set of Docker images
	for NAME in $(GPU_IMAGES) ; do \
	  docker image rm $(NAME):gpu.$$NAME.opt ; \
	done

.PHONY: prune-gpu.opt.rootless
prune-gpu.opt.rootless:		## Prune rootless GPU-based optimized set of Docker images
	for NAME in $(GPU_IMAGES) ; do \
	  docker image rm $(NAME):gpu.$$NAME.rootless.opt ; \
	done

.PHONY: prune
prune:		## Prune all related docker images
	make prune-cpu
	make prune-cpu.rootless
	make prune-gpu
	make prune-gpu.rootless
	make prune-gpu.opt
	make prune-gpu.opt.rootless
