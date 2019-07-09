
ROOT=../..

LAB=-v $(realpath $(ROOT)):/lab

all:
	@echo "usage: make [arm32v6|arm32v7|arm64v8] ROOT=<local-dir>"

.PHONY: all arm32v6 arm32v7 arm64v8 qemu-user

arm32v6: qemu-user
	@docker run -it --rm $(LAB) -v /usr/bin/qemu-arm-static:/usr/bin/qemu-arm-static raspbian/stretch bash

arm32v7: qemu-user
	@docker run -it --rm $(LAB) -v /usr/bin/qemu-arm-static:/usr/bin/qemu-arm-static arm32v7/debian:stretch bash

arm64v8: qemu-user
	@docker run -it --rm $(LAB) -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static arm64v8/debian:stretch bash

qemu-user:
	@apt install -y qemu-user-static binfmt-support
	@update-binfmts --enable qemu-arm
	@update-binfmts --enable qemu-aarch64
