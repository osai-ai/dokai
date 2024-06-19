.PHONY: test-cpu
test-cpu:		## Test CPU-based set of Docker images
	docker run --rm -it \
		--name=$(NAME) \
		dokai:cpu.core \
		python --version ; \
	docker run --rm -it \
		--name=$(NAME) \
		dokai:cpu.base \
		ffmpeg -version ; \
	docker run --rm -it \
		-v $(shell pwd):/root/workdir \
		--name=$(NAME) \
		dokai:cpu.base \
		pytest /root/workdir/tests/cpu

.PHONY: test-cpu.rootless
test-cpu.rootless:		## Test rootless CPU-based set of Docker images
	docker run --rm -it \
		--name=$(NAME) \
		dokai:cpu.core.rootless \
		python --version ; \
	docker run --rm -it \
		--name=$(NAME) \
		dokai:cpu.base.rootless \
		ffmpeg -version ; \
	docker run --rm -it \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--name=$(NAME) \
		dokai:cpu.base.rootless \
		pytest /home/$(UNAME)/workdir/tests/cpu

.PHONY: test-gpu
test-gpu:		## Test GPU-based set of Docker images
	docker run --rm -it \
		$(GPUS_OPTION) \
		--name=$(NAME) \
		dokai:gpu.core \
		python --version ; \
	docker run --rm -it \
		$(GPUS_OPTION) \
		--name=$(NAME) \
		dokai:gpu.ffmpeg \
		ffmpeg -version ; \
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd):/root/workdir \
		--name=$(NAME) \
		dokai:gpu.base \
		pytest /root/workdir/tests/cpu ; \
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd):/root/workdir \
		--name=$(NAME) \
		dokai:gpu.video \
		pytest /root/workdir/tests

.PHONY: test-gpu.opt
test-gpu.opt:		## Test optimized GPU-based set of Docker images
	docker run --rm -it \
		$(GPUS_OPTION) \
		--name=$(NAME) \
		dokai:gpu.core.opt \
		python --version ; \
	docker run --rm -it \
		$(GPUS_OPTION) \
		--name=$(NAME) \
		dokai:gpu.ffmpeg.opt \
		ffmpeg -version ; \
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd):/root/workdir \
		--name=$(NAME) \
		dokai:gpu.base.opt \
		pytest /root/workdir/tests/cpu ; \
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd):/root/workdir \
		--name=$(NAME) \
		dokai:gpu.video.opt \
		pytest /root/workdir/tests

.PHONY: test-gpu.rootless
test-gpu.rootless:		## Test rootless GPU-based set of Docker images
	docker run --rm -it \
		$(GPUS_OPTION) \
		--name=$(NAME) \
		dokai:gpu.core.rootless \
		python --version ; \
	docker run --rm -it \
		$(GPUS_OPTION) \
		--name=$(NAME) \
		dokai:gpu.ffmpeg.rootless \
		ffmpeg -version ; \
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--name=$(NAME) \
		dokai:gpu.base.rootless \
		pytest /home/$(UNAME)/workdir/tests/cpu ; \
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--name=$(NAME) \
		dokai:gpu.video.rootless \
		pytest /home/$(UNAME)/workdir/tests

.PHONY: test-gpu.opt.rootless
test-gpu.opt.rootless:		## Test rootless optimized GPU-based set of Docker images
	docker run --rm -it \
		$(GPUS_OPTION) \
		--name=$(NAME) \
		dokai:gpu.core.opt.rootless \
		python --version ; \
	docker run --rm -it \
		$(GPUS_OPTION) \
		--name=$(NAME) \
		dokai:gpu.ffmpeg.opt.rootless \
		ffmpeg -version ; \
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--name=$(NAME) \
		dokai:gpu.base.opt.rootless \
		pytest /home/$(UNAME)/workdir/tests/cpu ; \
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--name=$(NAME) \
		dokai:gpu.video.opt.rootless \
		pytest /home/$(UNAME)/workdir/tests

.PHONY: test
test:		## Test all Docker images
	make test-cpu
	make test-cpu.rootless
	make test-gpu
	make test-gpu.rootless
	make test-gpu.opt
	make test-gpu.opt.rootless
