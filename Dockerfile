FROM groonga/pgroonga:2.3.4-alpine-14

COPY data.* .
RUN cat data.sql.* > data.sql
RUN mv data.sql /docker-entrypoint-initdb.d/

COPY config/ /var/lib/postgresql/config/

EXPOSE 10000
CMD ["docker-entrypoint.sh", "-c", "config_file=/var/lib/postgresql/config/postgresql.conf"]
