PACKAGE = $(DOCKER_USERNAME)/debian
VERSION = squeeze

IMAGE = $(PACKAGE):$(VERSION)

all: build

build: Dockerfile
	docker build -t $(IMAGE) .

login:
	echo "$(DOCKER_PASSWORD)" | docker login -u $(DOCKER_USERNAME) --password-stdin

push: build
	docker push $(IMAGE)

.PHONY: all build login push

