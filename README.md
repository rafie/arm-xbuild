# Cross-build container for ARM platforms

## Synopsis

This container allows building of ARM (arm32v7, arm64v8) images on a x64 machine.

It uses a Go-based script that intercepts Docker shell commands and executes them with a user-mode QEMU emulator (a.k.a qemu-arm-static).

The image is based on a core variant of Ubuntu LTS 18.04.02 (Bionic Beaver), but it can easily be replaced by and other Linux distribution.

## Usage

For arm32v7 architecture (32-bit ARM CPU, a.k.a arm7l, armhf), use:

```
FROM redisfab/arm64v8-xbuild:bionic
RUN [ "cross-build-start" ]
...
# your code here
...
RUN [ "cross-build-end" ]
```

For arm64v8 architecture (64-bit ARM CPU, a.k.a ARMv8-A, aarch64), use:

```
FROM redisfab/arm32v7-xbuild:bionic
RUN [ "cross-build-start" ]
...
# your code here
...
RUN [ "cross-build-end" ]
```

For Dockerfiles with multiple FROM sections, duplicate the "cross-build" commands:

```
FROM redisfab/arm32v7-xbuild:bionic as builder
RUN [ "cross-build-start" ]
...
# your code here
...
RUN [ "cross-build-end" ]

FROM redisfab/arm32v7-xbuild:bionic
RUN [ "cross-build-start" ]
...
# your code here
...
RUN [ "cross-build-end" ]
```

Cross-build images can be cascaded, thus it is possible to create an image that will in turn be used to cross-build other images.

## Building cross-build images

Cross-build images should be built on a native ARM system. It is possible to build both arm32v7 and arm64v8 on the latter system. For that purpose, one can use an emulated VM on QEMU/KVM, a physical RPi device, on an AWS EC2 machine.

The standard way to build for the docker.io/redisfab repo is (Docker experimental features are required):

```
docker build --squash --rm -t redisfab/arm32v7-xbuild:stretch -f Dockerfile.arm32v7-stretch .
docker build --squash --rm -t redisfab/arm64v8-xbuild:stretch -f Dockerfile.arm64v8-stretch .
```

## Building QEMU binaries

This binary emulates a arm64v8 architecture while running on x64. To build it, we added a build script in the qemu/ directory. This script is meant to be executed inside a Debian container, so use:

```
docker run -it debian bash
```

and then run the build script. If you want to build a static QEMU image for arm32v7, you should change the `--target-list=aarch64-linux-user` configuration option to `--target-list=arm-linux-user`. Finally copy the QEMU binary into the bin directory of this project.

## Building the cross-build scripts

The cross-build scripts are meant to be executed on x64, thus should be compiled with GOARCH=amd64. A compiled version is already supplied in the bin/ directory.

## Reference

[1] [Building ARM containers on any x86 machine, even DockerHub](https://www.balena.io/blog/building-arm-containers-on-any-x86-machine-even-dockerhub/)

[2] https://hub.docker.com/r/project31/aarch64-centos-qemu/

[3]  https://hub.docker.com/r/project31/aarch64-docker-openvpn/~/dockerfile/

[4] https://hub.docker.com/r/multiarch/ubuntu-core/

[5] https://github.com/multiarch/ubuntu-core

[6] https://github.com/docker-library/official-images#architectures-other-than-amd64 

[7] https://github.com/balena-io/qemu

