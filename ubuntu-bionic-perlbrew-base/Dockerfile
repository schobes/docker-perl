FROM schobes/ubuntu-bionic-base:latest
LABEL maintainer="Adam Schobelock <schobes@gmail.com>"
MAINTAINER Adam Schobelock <schobes@gmail.com>
SHELL [ "/bin/bash", "-c" ]

ENV PERLBREW_ROOT=/opt/perlbrew
ENV PERLBREW_HOME=/opt/perlbrew/perl5

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get -y install perl curl build-essential && \
rm -rf /var/lib/apt/lists/* && \
apt-get autoclean

RUN curl -L https://install.perlbrew.pl | bash
RUN source /opt/perlbrew/etc/bashrc; \
perlbrew install-cpanm
RUN source /opt/perlbrew/etc/bashrc; \
perlbrew install-patchperl
