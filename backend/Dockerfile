FROM ruby:2.7.5-alpine

RUN apk add build-base sqlite-dev gcompat

COPY ./ /srv

WORKDIR /srv

RUN bundle install

ENTRYPOINT bundle exec rails db:migrate && \
           bundle exec rails s -b 0.0.0.0
