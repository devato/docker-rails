FROM ruby:2.4.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

LABEL maintainer="Troy Martin <troy@devato.com>"

ENV APP_HOME /app

# Bundle installs with binstubs to our custom /bundle/bin volume path.
# Let system use those stubs.
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY . $APP_HOME

