FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y mariadb-server

COPY tools/setup_mdb.sh ./setup_mdb.sh
COPY tools/mdb_init.sql ./etc/mysql/mdb_init.sql
COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d

RUN chmod +x ./setup_mdb.sh

EXPOSE 3306

RUN mkdir /run/mysqld

CMD ["./setup_mdb.sh"]
