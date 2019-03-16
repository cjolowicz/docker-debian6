DIRS = debian debian-i386 openssl openssl-i386 curl curl-i386 python git git-i386

all: build

build:
	set -ex; \
	for dir in $(DIRS) ; do \
	    $(MAKE) -C $$dir build ; \
	done

tag:
	set -ex; \
	for dir in $(DIRS) ; do \
	    $(MAKE) -C $$dir tag ; \
	done

push:
	set -ex; \
	for dir in $(DIRS) ; do \
	    $(MAKE) -C $$dir push ; \
	done

login:
	echo "$(DOCKER_PASSWORD)" | docker login -u $(DOCKER_USERNAME) --password-stdin

clean:
	set -ex; \
	for dir in $(DIRS) ; do \
	    $(MAKE) -C $$dir clean ; \
	done

.PHONY: all build tag push login clean
