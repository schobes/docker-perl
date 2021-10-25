FROM schobes/ubuntu-bionic-perlbrew:latest AS builder
LABEL maintainer="Adam Schobelock <schobes@gmail.com>"
MAINTAINER Adam Schobelock <schobes@gmail.com>
SHELL [ "/bin/bash", "-c" ]

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssl libssl-dev zlib1g-dev postgresql-client-12 libpq-dev 

ENV HARNESS_OPTIONS=j6

RUN /opt/perl-exec cpanm Mojolicious
RUN /opt/perl-exec cpanm IO::Socket::SSL
RUN /opt/perl-exec cpanm EV

RUN /opt/perl-exec cpanm Minion

RUN /opt/perl-exec cpanm Moo
RUN /opt/perl-exec cpanm Moops

RUN /opt/perl-exec cpanm Mojolicious::Plugin::AccessLog
RUN /opt/perl-exec cpanm MojoX::Log::Log4perl

RUN HARNESS_OPTIONS=j1 /opt/perl-exec cpanm Cache::Cache
RUN /opt/perl-exec cpanm Mojolicious::Plugin::CHI
RUN /opt/perl-exec cpanm Cache::Memcached
RUN /opt/perl-exec cpanm CHI::Driver::Memcached

RUN /opt/perl-exec cpanm Mojolicious::Plugin::AssetPack
RUN /opt/perl-exec cpanm JavaScript::Minifier::XS
RUN /opt/perl-exec cpanm CSS::Minifier::XS

## TODO: Check on --notest for DBD::Pg from time to time
RUN /opt/perl-exec cpanm --notest DBD::Pg
RUN /opt/perl-exec cpanm Mojo::Pg

RUN /opt/perl-exec cpanm --notest Perl::Tidy::Sweetened
RUN /opt/perl-exec cpanm Perl::Critic
RUN /opt/perl-exec cpanm Test2::Suite

