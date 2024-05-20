FROM debian:latest

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /tools

COPY ./tools/.env /tools/.env
COPY ./tools/mdb_init.sql /tools/mdb_init.sql
COPY ./tools/setup.sh /tools/setup.sh

RUN chmod +x /tools/setup.sh

CMD ["/tools/setup.sh"]
