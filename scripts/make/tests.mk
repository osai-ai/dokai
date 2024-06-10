.PHONE: test-cpu
test-cpu:		## Runs CPU docker images tests
	docker run --rm -it \
		$(GPUS_OPTION) \
		--net=host \
		--ipc=host \
		-v $(shell pwd):/workdir \
		--name=$(NAME) \
		dokai:cpu.base \
		pytest --cov=tests/cpu tests/cpu

.PHONY: test-gpu
test-gpu:		## Runs GPU docker images tests
	docker run --rm -it \
		$(GPUS_OPTION) \
		-v $(shell pwd):/workdir \
		--name=$(NAME) \
		dokai:gpu.video \
		pytest --cov=tests/gpu

.PHONY: test
test:		## Runs all tests
	make test-cpu
	make test-gpu
