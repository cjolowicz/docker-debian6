all: build

build: Dockerfile
	docker build -t $(IMAGE) .

tag: build
	set -ex ; \
	for tag in $(TAGS) ; do \
	    docker tag $(IMAGE) $(IMAGE):$$tag ; \
	done

push: tag
	set -ex ; \
	docker push $(IMAGE) ; \
	for tag in $(TAGS) ; do \
	    docker push $(IMAGE):$$tag ; \
	done

.PHONY: all build tag push login
