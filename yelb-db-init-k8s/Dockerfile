FROM alpine:3.18.0
ENTRYPOINT [ "/app/./init-db.sh" ]

WORKDIR /app
ENV POSTGRES_PORT=5432
ENV POSTGRES_DBNAME=yelbdatabase
ENV POSTGRES_DBHOST=postgresql
ENV PGPASSWORD=superpassword
ENV POSTGRES_USER=superadmin

RUN apk add --no-cache postgresql-client bash
COPY init-db.sh /app/init-db.sh
RUN chmod +x init-db.sh
