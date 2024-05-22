FROM debian:12.0

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /tools

COPY requirements/.env /tools/.env
COPY ./tools/mdb_init.sql /tools/mdb_init.sql
COPY ./tools/setup_mdb.sh /tools/setup_mdb.sh

RUN chmod +x /tools/setup_mdb.sh

CMD ["/tools/setup_mdb.sh"]
