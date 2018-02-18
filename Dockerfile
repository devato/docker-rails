FROM ruby:2.4.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

COPY . .

LABEL maintainer="Troy Martin <troy@devato.com>"

COPY . $APP_HOME

CMD puma -C config/puma.rb
