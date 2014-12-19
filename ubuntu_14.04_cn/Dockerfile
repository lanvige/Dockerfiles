# Ubuntu with CN sources.list Dockerfile
# VERSION   0.5

# Pull base image.
FROM docker.cn/docker/ubuntu:14.04

MAINTAINER Lanvige Jiang 'lanvige@gmail.com'

# Replace Ubuntu Source to CN
ENV DEBIAN_FRONTEND noninteractive
ADD ./sources.list /etc/apt/sources.list
# fix issue:- WARNING:root:could not open file
RUN chmod 644 /etc/apt/sources.list

# upgrade system
RUN apt-get update 
RUN apt-get upgrade -y

# Install basic lib
RUN apt-get install -y --force-yes software-properties-common
RUN apt-get install -y --force-yes build-essential git-core curl