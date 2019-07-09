
ARCH:=$(shell ./deps/readies/bin/platform --arch)
OSNICK ?= stretch
REPO=redisfab

ifeq ($(ARCH),x64)
$(error Cannot build this image on x64 platform; use an ARM machine)
endif

BUILD_OPT=--rm --squash

.PHONY: build public

all: build

build:
	docker build $(BUILD_OPT) -t $(REPO)/$(ARCH)-xbuild:$(OSNICK) -f Dockerfile.$(ARCH)-$(OSNICK) .

publish:
	docker push $(REPO)/$(ARCH)-xbuild:$(OSNICK)
