
ARCH:=$(shell ../deps/readies/bin/platform --arch)

ifneq ($(ARCH),x64)
$(error This is to be run from a x64 machine)
endif 

.PHONY: test

test:
	docker build --build-arg ARCH=arm32v7 .
	docker build --build-arg ARCH=arm64v8 .
