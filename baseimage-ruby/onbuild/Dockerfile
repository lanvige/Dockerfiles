# Ubuntu with CHINA sources
#
# VERSION               0.3

FROM ubuntu:14.04
MAINTAINER Lanvige Jiang, <lanvige@gmail.com>, http://blog.lanvige.com

# base image part
# ==
# avoid debconf and initrd
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

# APT config
ADD sources.list /etc/apt/sources.list

# Install the dependency tool & libraries
RUN apt-get update \
 && apt-get install --no-install-recommends -y software-properties-common \
 	  build-essential git-core sqlite3 locales curl zlib1g-dev \
 	  libssl-dev libreadline-dev libyaml-dev libsqlite3-dev \
 	  libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev \
 && update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX \
 && locale-gen en_US.UTF-8 \
 && dpkg-reconfigure locales \
 && apt-get clean \
 && rm -rf /etc/apt/sources.list.d/* /tmp/* /var/tmp/*

# Ruby part
# ==
# Install Ruby and Bundler
RUN add-apt-repository -y ppa:brightbox/ruby-ng \
 && apt-get update -yq \
 && apt-get install -yq ruby2.2 \
 && gem install --no-document bundler \
 && apt-get clean \
 && rm -rf /etc/apt/sources.list.d/* /tmp/* /var/tmp/*

# Ruby buildpack part
# ==
# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo -E bash - \
 && apt-get update \
 && apt-get install -yq nodejs \
 && apt-get clean \
 && rm -rf /etc/apt/sources.list.d/* /tmp/* /var/tmp/*

# Install MySQL, PG, SQLite
RUN apt-get update \
 && apt-get install -yq mysql-client libmysqlclient-dev \
      postgresql-client sqlite3 \
 && apt-get clean \
 && rm -rf /etc/apt/sources.list.d/* /tmp/* /var/tmp/*


