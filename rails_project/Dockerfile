# Rails Dockerfile
# VERSION   0.6

# Pull base image.
FROM lanvige/ruby:2.1.5

MAINTAINER Lanvige Jiang 'lanvige@gmail.com'

# Install Rails App
WORKDIR /app
ONBUILD ADD Gemfile /app/Gemfile
ONBUILD ADD Gemfile.lock /app/Gemfile.lock
ONBUILD RUN bundle install --without development test
ONBUILD ADD . /app

# Add default foreman config
# ADD Procfile /app/Procfile

ENV RAILS_ENV production

# Add default unicorn config
ADD unicorn.rb /app/config/unicorn.rb

ONBUILD ADD . /app

CMD bundle exec rake assets:precompile && bundle exec unicorn -c config/unicorn.rb