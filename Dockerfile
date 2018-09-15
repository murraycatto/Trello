FROM ruby:latest
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs unzip
RUN mkdir /Trello
WORKDIR /Trello
COPY Gemfile /Trello/Gemfile
COPY Gemfile.lock /Trello/Gemfile.lock
RUN bundle install
COPY . /Trello

EXPOSE 3000 5432
