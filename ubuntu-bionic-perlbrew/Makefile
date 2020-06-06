VERSION		:= latest

USER        ?= schobes
PWD			:= $(shell basename `pwd`)
REPOSITORY	:= $(USER)/$(PWD)
NAME		:= $(REPOSITORY):$(VERSION)

ifeq ($(VERSION),latest)
PERL_VERSION=stable
else
PERL_VERSION=$(VERSION)
endif

ifdef FORCE
ARG_FORCE=--build-arg FORCE=--force
endif
ifdef NOTEST
ARG_NOTEST=--build-arg NOTEST=--notest
endif

.PHONY: build
build:
	docker build $(DOCKER_BUILD_OPTS) -t $(NAME) --build-arg VERSION=$(PERL_VERSION) $(ARG_FORCE) $(ARG_NOTEST) ./
	PV=`docker run --rm $(NAME) ls /opt/perlbrew/perls | cut -d '-' -f 2 |grep -v perl`; \
	if [ "$$PV" != "$(PERL_VERSION)" ]; then \
		docker tag $(NAME) $(REPOSITORY):$$PV; \
	fi

.PHONY: all
all: install

.PHONY: install
install: build
	docker push $(NAME)
	PV=`docker run --rm $(NAME) ls /opt/perlbrew/perls | cut -d '-' -f 2 |grep -v perl`; \
	if [ "$$PV" != "$(PERL_VERSION)" ]; then \
		docker push $(REPOSITORY):$$PV; \
	fi

