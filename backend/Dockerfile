FROM ruby:2.6.6

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  libpq-dev \
  vim \
  sudo && \
  gem install bundler:2.0.2

RUN bundle install

RUN echo 'alias bi="bundle install"' >> ~/.bashrc
RUN echo 'alias rc="rails console"' >> ~/.bashrc
RUN echo 'alias rp="bundle exec ridgepole --config ./config/database.yml --file ./Schemafile --apply"' >> ~/.bashrc

ADD . /app
