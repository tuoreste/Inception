FROM debian:bullseye

# RUN mkdir -p /run/mysqld && \
# 	chmod 777 /run/mysqld

RUN apt-get update && apt-get upgrade && \
	apt-get install -y mariadb-server

EXPOSE 3306

COPY /tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY /tools/setup_mdb.sh /setup_mdb.sh
#COPY /tools/mdb_init.sql /etc/mysql/
RUN mkdir -p /run/mysqld && \
	touch /run/mysqld/mysqld.pid


RUN chmod +x /setup_mdb.sh && \
	chmod 777 /run/mysqld/mysqld.pid

# RUN ./setup_mdb.sh
# CMD ["/setup_mdb.sh"]
CMD ["./setup_mdb.sh"]
