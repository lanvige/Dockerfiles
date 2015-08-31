# Rails Dockerfile
# VERSION   0.5

# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.

FROM lanvige/ruby:2.2
MAINTAINER Lanvige Jiang <lanvige@gmail.com>

# Ruby buildpack part
# Install Node.js MySQL, PG, SQLite
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo -E bash - \
 && apt-get update \
 && apt-get install -yq nodejs \
      mysql-client libmysqlclient-dev \
      postgresql-client sqlite3 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*