# Rails Dockerfile
# VERSION   0.5

# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.

FROM lanvige/ruby:buildpack
MAINTAINER Lanvige Jiang <lanvige@gmail.com>

# Rails 部分
ENV APP_HOME="/app" \
    RAILS_ENV=production

COPY assets/setup/ ${SETUP_DIR}/
RUN bash ${SETUP_DIR}/install.sh

COPY assets/config/ ${SETUP_DIR}/config/
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 22/tcp 80/tcp 443/tcp

VOLUME ["${APP_HOME}"]
WORKDIR ${APP_HOME}

ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["app:start"]