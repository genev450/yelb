FROM postgres:10.0-alpine

WORKDIR /

ENV POSTGRES_PASSWORD=password

COPY init-yelb-db.sh /docker-entrypoint-initdb.d/init-yelb-db.sh
