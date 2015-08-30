# Rails Dockerfile
# VERSION   0.5

# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM lanvige/baseimage:latest
MAINTAINER Lanvige Jiang <lanvige@gmail.com>


RUN add-apt-repository -y ppa:brightbox/ruby-ng \
 && add-apt-repository -y ppa:chris-lea/node.js \
 && apt-get update -q && apt-get install -yq nodejs 
 && apt-get update \
 && apt-get install -y ruby2.2 nodejs \
 && gem install --no-document bundler \
 && rm -rf /var/lib/apt/lists/*