FROM schobes/ubuntu-bionic-perlbrew-base:latest
LABEL maintainer="Adam Schobelock <schobes@gmail.com>"
MAINTAINER Adam Schobelock <schobes@gmail.com>
SHELL [ "/bin/bash", "-c" ]

ARG VERSION=stable
ARG JOBS=6
ARG FORCE
ARG NOTEST

COPY install.sh /opt/install.sh
RUN /bin/bash /opt/install.sh && rm -f /opt/install.sh

COPY perl-exec /opt/perl-exec
