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

ADD .app /app

# Install Rails App
WORKDIR /app
RUN bundle install --without development test

# Add default unicorn config
ADD unicorn.rb /app/config/unicorn.rb

EXPOSE 8080

CMD bundle exec rake assets:precompile && bundle exec unicorn -p 8080 -c config/unicorn.rb