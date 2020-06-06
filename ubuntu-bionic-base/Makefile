VERSION		:= latest

USER        ?= schobes
PWD			:= $(shell basename `pwd`)
REPOSITORY	:= $(USER)/$(PWD)
NAME		:= $(REPOSITORY):$(VERSION)

.PHONY: build
build:
	docker build $(DOCKER_BUILD_OPTS) -t $(NAME) .

.PHONY: all
all: install

.PHONY: install
install: build
	docker push $(NAME)

