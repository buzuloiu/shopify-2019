FROM ruby:2.6.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /shopify-2019
WORKDIR /shopify-2019

COPY Gemfile /shopify-2019/Gemfile
COPY Gemfile.lock /shopify-2019/Gemfile.lock

RUN bundle install

COPY . /shopify-2019
