FROM ruby:2.7.4
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /searching_outlet

ADD Gemfile /searching_outlet/Gemfile
ADD Gemfile.lock /searching_outlet/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /searching_outlet
