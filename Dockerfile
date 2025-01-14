FROM ubuntu:noble AS data

COPY data.* ./
RUN cat data.sql.* > data.sql

FROM groonga/pgroonga:3.2.2-alpine-16-slim as initdb

COPY --from=data data.sql /docker-entrypoint-initdb.d/

RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV POSTGRES_DB=database
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV PGDATA=/data

RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"]

FROM groonga/pgroonga:3.2.2-alpine-16-slim

COPY --from=initdb /data $PGDATA
COPY config/ /var/lib/postgresql/config/

EXPOSE 10000
CMD ["docker-entrypoint.sh", "-c", "config_file=/var/lib/postgresql/config/postgresql.conf"]
