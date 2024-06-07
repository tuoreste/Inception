# Use Debian Buster as the base image
FROM debian:bullseye

# Update package lists, upgrade packages, and install MariaDB server
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy custom configuration and initialization scripts
COPY tools/setup_mdb.sh /setup_mdb.sh
COPY tools/mdb_init.sql /etc/mysql/mdb_init.sql
COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Set appropriate permissions
RUN chmod +x /setup_mdb.sh && \
    mkdir -p /run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld /var/log/mysql && \
    chmod -R 755 /var/lib/mysql /var/run/mysqld /var/log/mysql

# Expose MariaDB port
EXPOSE 3306

# Run initialization script to configure MariaDB
CMD ["/setup_mdb.sh"]
