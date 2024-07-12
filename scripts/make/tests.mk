.PHONY: test-cpu
test-cpu:		## Test CPU-based set of Docker images
	docker run --rm -it \
		-v $(shell pwd):/root/workdir \
		--workdir=/root/workdir \
		--name=$(NAME) \
		$(NAME):cpu.core \
		/bin/bash -c "pip install pytest && python -m pytest -v -m 'cpu and core and rootful'" && \
	docker run --rm -it \
		-v $(shell pwd):/root/workdir \
		--workdir=/root/workdir \
		--name=$(NAME) \
		$(NAME):cpu.ffmpeg \
		/bin/bash -c "pip install pytest && python -m pytest -v -m 'cpu and ffmpeg and rootful'" && \
	docker run --rm -it \
		-v $(shell pwd):/root/workdir \
		--workdir=/root/workdir \
		--name=$(NAME) \
		$(NAME):cpu.base \
		/bin/bash -c "pip install pytest && python -m pytest -v -m 'cpu and base and rootful'" && \
	docker run --rm -it \
		-v $(shell pwd):/root/workdir \
		--workdir=/root/workdir \
		--name=$(NAME) \
		$(NAME):cpu.pytorch \
		/bin/bash -c "python -m pytest -v -m 'cpu and pytorch and rootful'"

.PHONY: test-cpu.rootless
test-cpu.rootless:		## Test rootless CPU-based set of Docker images
	docker run --rm -it \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--workdir=/home/$(UNAME)/workdir \
		--name=$(NAME) \
		$(NAME):cpu.core \
		/bin/bash -c "pip install pytest && python -m pytest -v -m 'cpu and core and rootless'" && \
	docker run --rm -it \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--workdir=/home/$(UNAME)/workdir \
		--name=$(NAME) \
		$(NAME):cpu.ffmpeg \
		/bin/bash -c "pip install pytest && python -m pytest -v -m 'cpu and ffmpeg and rootless'" && \
	docker run --rm -it \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--workdir=/home/$(UNAME)/workdir \
		--name=$(NAME) \
		$(NAME):cpu.base \
		/bin/bash -c "python -m pytest -v -m 'cpu and base and rootless'" && \
	docker run --rm -it \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--workdir=/home/$(UNAME)/workdir \
		--name=$(NAME) \
		$(NAME):cpu.pytorch \
		/bin/bash -c "python -m pytest -v -m 'cpu and pytorch and rootless'"

.PHONY: test-gpu
test-gpu:		## Test GPU-based set of Docker images
	docker run --rm -it \
		-v $(shell pwd):/root/workdir \
		--workdir=/root/workdir \
		--name=$(NAME) \
		$(NAME):gpu.core \
		/bin/bash -c "pip install pytest && python -m pytest -v -m 'gpu and core and rootful'" && \
	docker run --rm -it \
		-v $(shell pwd):/root/workdir \
		--workdir=/root/workdir \
		--name=$(NAME) \
		$(NAME):gpu.ffmpeg \
		/bin/bash -c "pip install pytest && python -m pytest -v -m 'gpu and ffmpeg and rootful'" && \
	docker run --rm -it \
		-v $(shell pwd):/root/workdir \
		--workdir=/root/workdir \
		--name=$(NAME) \
		$(NAME):gpu.base \
		/bin/bash -c "pip install pytest && python -m pytest -v -m 'gpu and base and rootful'" && \
	docker run --rm -it \
		-v $(shell pwd):/root/workdir \
		--workdir=/root/workdir \
		--name=$(NAME) \
		$(NAME):gpu.pytorch \
		/bin/bash -c "python -m pytest -v -m 'gpu and pytorch and rootful'" && \
	docker run --rm -it \
		-v $(shell pwd):/root/workdir \
		--workdir=/root/workdir \
		--name=$(NAME) \
		$(NAME):gpu.video \
		/bin/bash -c "python -m pytest -v -m 'gpu and video and rootful'"

.PHONY: test-gpu.rootless
test-gpu.rootless:		## Test rootless GPU-based set of Docker images
	docker run --rm -it \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--workdir=/home/$(UNAME)/workdir \
		--name=$(NAME) \
		$(NAME):gpu.core.rootless \
		/bin/bash -c "pip install pytest && python -m pytest -v -m 'gpu and core and rootless'" && \
	docker run --rm -it \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--workdir=/home/$(UNAME)/workdir \
		--name=$(NAME) \
		$(NAME):gpu.ffmpeg.rootless \
		/bin/bash -c "pip install pytest && python -m pytest -v -m 'gpu and ffmpeg and rootless'" && \
	docker run --rm -it \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--workdir=/home/$(UNAME)/workdir \
		--name=$(NAME) \
		$(NAME):gpu.base.rootless \
		/bin/bash -c "pip install pytest && python -m pytest -v -m 'gpu and base and rootless'" && \
	docker run --rm -it \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--workdir=/home/$(UNAME)/workdir \
		--name=$(NAME) \
		$(NAME):gpu.pytorch.rootless \
		/bin/bash -c "python -m pytest -v -m 'gpu and pytorch and rootless'" && \
	docker run --rm -it \
		-v $(shell pwd):/home/$(UNAME)/workdir \
		--workdir=/home/$(UNAME)/workdir \
		--name=$(NAME) \
		$(NAME):gpu.video.rootless \
		/bin/bash -c "python -m pytest -v -m 'gpu and video and rootless'"

.PHONY: test-gpu.opt
test-gpu.opt: test-gpu		## Test optimized GPU-based set of Docker images

.PHONY: test-gpu.opt.rootless
test-gpu.opt.rootless: test-gpu.rootless		## Test rootless optimized GPU-based set of Docker images

.PHONY: test
test:		## Test all Docker images
	make test-cpu
	make test-cpu.rootless
	make test-gpu
	make test-gpu.rootless
	make test-gpu.opt
	make test-gpu.opt.rootless
