FROM ruby:2.5-alpine
MAINTAINER fsadiq1@jhu.edu
ENV PK_RUBY_BUILD build-base ruby-dev openssl libc-dev linux-headers
RUN apk --update --no-cache add $PK_RUBY_BUILD freetds-dev

# Simple run base-image
# docker run -it ruby:2.5-alpine sh
# Build this image
# docker build --rm -t local/rubyhz .
# Run this image maping filesystem to /opt
# docker run -it --name rubyhz -p 3000:3000 -v $PWD:/opt ruby bash

