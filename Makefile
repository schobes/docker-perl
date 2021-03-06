.PHONY: build
build:
	make -C ubuntu-bionic-base
	make -C ubuntu-bionic-perlbrew-base
	make -C ubuntu-bionic-perlbrew
	make -C ubuntu-bionic-perlbrew-mojolicious

.PHONY: all
all:
	make -C ubuntu-bionic-base all
	make -C ubuntu-bionic-perlbrew-base all
	make -C ubuntu-bionic-perlbrew all
	make -C ubuntu-bionic-perlbrew-mojolicious all

.PHONY: rebuild
rebuild:
	make -C ubuntu-bionic-base DOCKER_BUILD_OPTS=--no-cache
	make -C ubuntu-bionic-perlbrew-base DOCKER_BUILD_OPTS=--no-cache
	make -C ubuntu-bionic-perlbrew DOCKER_BUILD_OPTS=--no-cache
	make -C ubuntu-bionic-perlbrew-mojolicious DOCKER_BUILD_OPTS=--no-cache

