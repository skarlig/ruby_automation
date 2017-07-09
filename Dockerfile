FROM ruby:2.4.1
MAINTAINER c.stefani91@googlemail.com

WORKDIR /app
ENV ROOT="/app"
COPY selenium/Gemfile selenium/Gemfile.lock selenium/build_driver.rb /app/
COPY /selenium/ $ROOT/

RUN gem install bundler
RUN bundle install

# Define the ENV variable
ENV BROWSER="chrome"

RUN ruby build_driver.rb
