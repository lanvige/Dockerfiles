# Rails Dockerfile
# VERSION   0.5

MAINTAINER Lanvige Jiang 'lanvige@gmail.com'

# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:latest

# Replace with 163 source
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]


# ...put your own build instructions here...

# Enable SSHD
RUN rm -f /etc/service/sshd/down


# Use a version available on the Brightbox repo (https://www.brightbox.com/docs/ruby/ubuntu/)
ENV RUBY_VERSION 2.2

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C3173AA6 && \
    echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main > /etc/apt/sources.list.d/brightbox-ruby-ng-trusty.list && \
    apt-get update -q && apt-get install -yq --no-install-recommends \
        ca-certificates \
        openssl \
        libssl-dev \
        g++ \
        gcc \
        libc6-dev \
        make \
        patch \
        ruby$RUBY_VERSION \
        ruby$RUBY_VERSION-dev && \

    # clean up
    rm -rf /var/lib/apt/lists/* && \
    truncate -s 0 /var/log/*log && \

    # Setup Rubygems
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install bundler && gem update --system


# Install Node.js
RUN add-apt-repository -y ppa:chris-lea/node.js \ 
    apt-get update -q && apt-get install -yq nodejs


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*