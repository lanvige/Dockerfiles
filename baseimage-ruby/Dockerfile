# Rails Dockerfile
# VERSION   0.5

# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:latest


MAINTAINER Lanvige Jiang 'lanvige@gmail.com'

# Replace with 163 source
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]


# ...put your own build instructions here...

# Enable SSHD
RUN rm -f /etc/service/sshd/down


# Use a version available on the Brightbox repo (https://www.brightbox.com/docs/ruby/ubuntu/)
ENV RUBY_VERSION 2.2

ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.2

# some of ruby's build scripts are written in ruby
# we purge this later to make sure our final image uses what we just built
RUN apt-get update \
    && apt-get install -y bison ruby \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /usr/src/ruby \
    && curl -SL "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.bz2" \
        | tar -xjC /usr/src/ruby --strip-components=1 \
    && cd /usr/src/ruby \
    && autoconf \
    && ./configure --disable-install-doc \
    && make -j"$(nproc)" \
    && apt-get purge -y --auto-remove bison ruby \
    && make install \
    && rm -r /usr/src/ruby

# skip installing gem documentation
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

# install things globally, for great justice
ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH
RUN gem install bundler \
    && bundle config --global path "$GEM_HOME" \
    && bundle config --global bin "$GEM_HOME/bin"

# don't create ".bundle" in all our apps
ENV BUNDLE_APP_CONFIG $GEM_HOME


# Install Node.js
RUN add-apt-repository -y ppa:chris-lea/node.js \ 
    apt-get update -q && apt-get install -yq nodejs


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*