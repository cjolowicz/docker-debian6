PACKAGE = $(DOCKER_USERNAME)/python-debian6
VERSION = 3.7.2

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

