FROM ruby:alpine
MAINTAINER Hiroki Yagita <yagihiro@gmail.com>

RUN apk --no-cache --update add git build-base ruby-dev

ENV ROOT /app

COPY . $ROOT
WORKDIR $ROOT
RUN bundle config --global jobs 4
RUN bundle install
EXPOSE 4569

RUN apk del build-base ruby-dev && rm -rf /var/cache/apk/*

ENTRYPOINT ["bundle", "exec"]
CMD ["fakes3", "-r", "/app", "-p",  "4569", "--reuse_address"]
