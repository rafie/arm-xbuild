
ROOT=../..

LAB=-v $(realpath $(ROOT)):/lab

ARM6_IMAGE=balenalib/raspberrypi3-debian
ARM7_IMAGE=arm32v7/debian:buster
ARM8_IMAGE=arm64v8/debian:buster

# ARM6_IMAGE=raspbian/stretch
# ARM7_IMAGE=arm32v7/debian:stretch
# ARM8_IMAGE=arm64v8/debian:stretch

all:
	@echo "usage: make [arm32v6|arm32v7|arm64v8] ROOT=<local-dir>"

.PHONY: all arm32v6 arm32v7 arm64v8 qemu-user

arm32v6: qemu-user
	@docker run -it --rm $(LAB) -v /usr/bin/qemu-arm-static:/usr/bin/qemu-arm-static $(ARM6_IMAGE) bash

arm32v7: qemu-user
	@docker run -it --rm $(LAB) -v /usr/bin/qemu-arm-static:/usr/bin/qemu-arm-static $(ARM7_IMAGE) bash

arm64v8: qemu-user
	@docker run -it --rm $(LAB) -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static $(ARM8_IMAGE) bash

qemu-user:
	@apt install -y qemu-user-static binfmt-support
	@update-binfmts --enable qemu-arm
	@update-binfmts --enable qemu-aarch64
