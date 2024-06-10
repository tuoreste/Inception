FROM debian:bullseye

RUN mkdir -p /run/mysqld && \
	chmod 777 /run/mysqld

RUN apt-get update && apt-get upgrade && \
	apt-get install -y mariadb-server

EXPOSE 3306

COPY /tools/50-server.cnf /etc/mysqld/
COPY /tools/setup_mdb.sh /setup_mdb.sh
RUN chmod +x /setup_mdb.sh

CMD ["/setup_mdb.sh"]

