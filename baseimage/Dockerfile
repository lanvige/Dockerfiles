# Ubuntu with CHINA sources
#
# VERSION               0.3

FROM ubuntu:14.04
#FROM lanvige/base

MAINTAINER Lanvige Jiang, "lanvige@gmail.com", http://blog.lanvige.com

# avoid debconf and initrd
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

# apt config
ADD sources.list /etc/apt/sources.list
# Replace source to 163 for #thegreatwall
# RUN echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" > /etc/apt/sources.lis


RUN apt-get update \
 && apt-get install --no-install-recommends -y software-properties-common \
 	  build-essential git-core sqlite3 locales curl zlib1g-dev \
 	  libssl-dev libreadline-dev libyaml-dev libsqlite3-dev \
 	  libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev \
 && update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX \
 && locale-gen en_US.UTF-8 \
 && dpkg-reconfigure locales \
 && rm -rf /var/lib/apt/lists/*