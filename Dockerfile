FROM ruby:alpine
MAINTAINER Hiroki Yagita <yagihiro@gmail.com>

ADD Gemfile /
ADD Gemfile.lock /

RUN bundle install

EXPOSE 4569

WORKDIR /fakes3_root

ENTRYPOINT ["bundle", "exec"]
CMD ["fakes3", "-r",  "/fakes3_root", "-p",  "4569", "--reuse_address"]
