all: build

Dockerfile: Dockerfile.m4 *.m4
	m4 Dockerfile.m4 > Dockerfile

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

clean:
	if [ -f Dockerfile.m4 ] ; then \
            rm -f Dockerfile ; \
	fi

.PHONY: all build tag push login clean
