PACKAGE = $(DOCKER_USERNAME)/curl-debian6
VERSION = 7.64.0

IMAGE = $(PACKAGE):$(VERSION)

all: build

build: Dockerfile
	docker build -t $(IMAGE) .

login:
	echo "$(DOCKER_PASSWORD)" | docker login -u $(DOCKER_USERNAME) --password-stdin

push: build
	docker push $(IMAGE)
	version=$(VERSION) ; \
	for tag in $${version%.*} $${version%%.*} latest ; do \
	    docker tag $(IMAGE) $(PACKAGE):$$tag ; \
	    docker push $(PACKAGE):$$tag ; \
	done ; \

.PHONY: all build login push

