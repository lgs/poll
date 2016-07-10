FROM ruby:latest
MAINTAINER Luca G. Soave <luca.soave@gmail.com>

# ENV BUNDLE_PATH /bundle_gems
ENV HOME /poll

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

WORKDIR $HOME

ADD Gemfile* $HOME/
RUN bundle install 

ADD . $HOME

