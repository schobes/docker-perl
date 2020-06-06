VERSION		:= stable

USER        ?= schobes
PWD			:= $(shell basename `pwd`)
REPOSITORY	:= $(USER)/$(PWD)
NAME		:= $(REPOSITORY):$(VERSION)

ifdef FORCE
ARG_FORCE=--build-arg FORCE=--force
endif
ifdef NOTEST
ARG_NOTEST=--build-arg NOTEST=--notest
endif

.PHONY: build
build:
	docker build $(DOCKER_BUILD_OPTS) ../$(PWD) --build-arg VERSION=$(VERSION) $(ARG_FORCE) $(ARG_NOTEST)
	IMAGE_ID=`docker build ../$(PWD) --build-arg VERSION=$(VERSION) $(ARG_FORCE) $(ARG_NOTEST) 2>&1| grep 'Successfully built' | cut -d' ' -f 3`; \
	docker tag $$IMAGE_ID $(NAME); \
	PV=`docker run --name get_perl_version $(NAME) ls /opt/perlbrew/perls | cut -d '-' -f 2`; \
	if [ "$$PV" != "$$VERSION" ]; then \
		docker tag $$IMAGE_ID $(REPOSITORY):$$PV; \
	fi
	docker rm get_perl_version

.PHONY: all
all: install

.PHONY: install
install: build
	docker push $(NAME)
	PV=`docker run --name get_perl_version $(NAME) ls /opt/perlbrew/perls | cut -d '-' -f 2`; \
	if [ "$$PV" != "$$VERSION" ]; then \
		docker push $(REPOSITORY):$$PV; \
	fi
	docker rm get_perl_version

