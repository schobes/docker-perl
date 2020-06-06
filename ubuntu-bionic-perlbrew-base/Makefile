VERSION		:= latest

USER        ?= schobes
PWD			:= $(shell basename `pwd`)
REPOSITORY	:= $(USER)/$(PWD)
NAME		:= $(REPOSITORY):$(VERSION)

.PHONY: build
build:
	docker build $(DOCKER_BUILD_OPTS) ../$(PWD)
	IMAGE_ID=`docker build ../$(PWD) 2>&1| grep 'Successfully built' | cut -d' ' -f 3`; \
	docker tag $$IMAGE_ID $(NAME)

.PHONY: all
all: install

.PHONY: install
install: build
	docker push $(NAME)

