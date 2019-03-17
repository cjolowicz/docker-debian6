DIRS = debian openssl curl python git
ARCHS = x86_64 i386

all: build

build:
	set -ex; \
	for dir in $(DIRS) ; do \
	    for arch in $(ARCHS) ; do \
	        $(MAKE) -C $$dir ARCH=$$arch build ; \
	    done ; \
	done

tag:
	set -ex; \
	for dir in $(DIRS) ; do \
	    for arch in $(ARCHS) ; do \
	        $(MAKE) -C $$dir ARCH=$$arch tag ; \
	    done ; \
	done

push:
	set -ex; \
	for dir in $(DIRS) ; do \
	    for arch in $(ARCHS) ; do \
	        $(MAKE) -C $$dir ARCH=$$arch push ; \
	    done ; \
	done

login:
	echo "$(DOCKER_PASSWORD)" | docker login -u $(DOCKER_USERNAME) --password-stdin

clean:
	set -ex; \
	for dir in $(DIRS) ; do \
	    $(MAKE) -C $$dir clean ; \
	done

.PHONY: all build tag push login clean
