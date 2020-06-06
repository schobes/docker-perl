FROM schobes/ubuntu-bionic-perlbrew:5.30.2 AS builder
LABEL maintainer="Adam Schobelock <schobes@gmail.com>"
MAINTAINER Adam Schobelock <schobes@gmail.com>
SHELL [ "/bin/bash", "-c" ]

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y perl openssl libssl-dev zlib1g-dev postgresql-client-12 libpq-dev 

ENV HARNESS_OPTIONS=j6

RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm Mojolicious
RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm IO::Socket::SSL
RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm EV

RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm Minion

RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm Moo
RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm Moops

RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm Mojolicious::Plugin::AccessLog
RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm MojoX::Log::Log4perl

RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm Mojolicious::Plugin::CHI
RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm Cache::Memcached
RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm CHI::Driver::Memcached

RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm Mojolicious::Plugin::AssetPack
RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm JavaScript::Minifier::XS
RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm CSS::Minifier::XS

## TODO: Check on --notest for DBD::Pg from time to time
RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm --notest DBD::Pg
RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm Mojo::Pg

RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm Perl::Tidy::Sweetened
RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm Perl::Critic
RUN /opt/perlbrew/bin/perlbrew exec --with 'perl-5.30.2' cpanm Test2::Suite


## Rebuild so we can make the size a bit smaller
FROM schobes/ubuntu-bionic-perlbrew:5.30.2
ENV PERLBREW_ROOT=/opt/perlbrew
ENV PERLBREW_HOME=/opt/perlbrew/perl5
COPY --from=builder /opt/perlbrew /opt/perlbrew

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y perl openssl postgresql-client-12 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoclean

