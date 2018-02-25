FROM ruby:2.4.3

RUN \
  DEBIAN_FRONTEND=noninteractive \
  apt-get update -qq

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get install -y \
    build-essential \
    libpq-dev nodejs \
    chromium \
    iceweasel \
    xvfb

LABEL maintainer="Troy Martin <troy@devato.com>"

ENV APP_HOME /dockerapp

# Bundle installs with binstubs to our custom /bundle/bin volume path.
# Let system use those stubs.
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
ADD docker $APP_HOME/docker/
RUN bash docker/bundle.sh

ADD . $APP_HOME


