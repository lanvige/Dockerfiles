# Rails Dockerfile
# VERSION   0.6

# Pull base image.
FROM lanvige/ruby:2.1.5

MAINTAINER Lanvige Jiang 'lanvige@gmail.com'

# Add default foreman config
# ADD Procfile /app/Procfile

# SqLite
RUN apt-get -y install sqlite3 libsqlite3-dev

ENV RAILS_ENV production

ADD ./app /app

ADD ./scripts/rails-start.sh /usr/bin/rails-start
RUN chmod +x /usr/bin/rails-start


# Install Rails App
WORKDIR /app
RUN bundle install --without development test

# Add default unicorn config
ADD ./config/unicorn.rb /app/config/unicorn.rb

EXPOSE 8080


ENTRYPOINT /usr/bin/start-server