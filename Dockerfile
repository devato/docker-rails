FROM ruby:2.4.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

LABEL maintainer="Troy Martin <troy@devato.com>"

ENV APP_HOME /app

# cache bundle
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY . $APP_HOME

CMD puma -C config/puma.rb
