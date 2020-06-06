FROM ubuntu:bionic
LABEL maintainer="Adam Schobelock <schobes@gmail.com>"
MAINTAINER Adam Schobelock <schobes@gmail.com>
RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && \
DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils && \
rm -rf /var/lib/apt/lists/* && \
apt-get autoclean
