FROM ruby:2.6.10-alpine3.15
CMD ["./startup.sh"]
EXPOSE 4567
WORKDIR /app

ENV LANG=en_us.UTF-8
ENV LC_ALL=C.UTF-8
ENV RACK_ENV=production
ENV YELB_DB_PASSWORD=dbpass
ENV YELB_DB_USER=dbuser
ENV YELB_DB_NAME=yelbdatabase
ENV YELB_DB_PORT=5432
ENV REDIS_SERVER_ENDPOINT=redis
ENV TEST_ENV=just_need_new_build

RUN apk update &&\
    gem install sinatra --no-document &&\
    gem install redis --no-document &&\
    apk add --no-cache libpq-dev build-base &&\
    gem install pg --no-document &&\
    gem install aws-sdk-dynamodb

COPY startup.sh startup.sh
COPY Gemfile Gemfile
COPY modules modules
COPY yelb-appserver.rb yelb-appserver.rb
