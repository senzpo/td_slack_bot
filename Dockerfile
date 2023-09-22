FROM ruby:3.1.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem install bundler rubygems-bundler

RUN mkdir -p /app
WORKDIR /app

ARG RAILS_ENV=production

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /app

RUN SECRET_KEY_BASE='SECRET_KEY_BASE' bundle exec rake assets:precompile

EXPOSE 3000

CMD ["./bin/rails", "s", "-b", "0.0.0.0", "-p", "3000"]
