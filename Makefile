DIRS = debian openssl curl python git

all: build

build:
	for dir in $(DIRS) ; do \
	    $(MAKE) -C $$dir build ; \
	done

login:
	echo "$(DOCKER_PASSWORD)" | docker login -u $(DOCKER_USERNAME) --password-stdin

push:
	for dir in $(DIRS) ; do \
	    $(MAKE) -C $$dir push ; \
	done

.PHONY: all build login push
