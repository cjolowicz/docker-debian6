DIRS = debian openssl curl python git
ARCHS = x86_64 i386

all: build

build:
	set -ex; \
	for dir in $(DIRS) ; do \
	    for arch in $(ARCHS) ; do \
	        $(MAKE) -C $$dir ARCH=$$arch REPO=$(DOCKER_USERNAME) build ; \
	    done ; \
	done

tag:
	set -ex; \
	for dir in $(DIRS) ; do \
	    for arch in $(ARCHS) ; do \
	        $(MAKE) -C $$dir ARCH=$$arch REPO=$(DOCKER_USERNAME) tag ; \
	    done ; \
	done

push:
	set -ex; \
	for dir in $(DIRS) ; do \
	    for arch in $(ARCHS) ; do \
	        $(MAKE) -C $$dir ARCH=$$arch REPO=$(DOCKER_USERNAME) push ; \
	    done ; \
	done

login:
	echo "$(DOCKER_PASSWORD)" | docker login -u $(DOCKER_USERNAME) --password-stdin

.PHONY: all build tag push login
