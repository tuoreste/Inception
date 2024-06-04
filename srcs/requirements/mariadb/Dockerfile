FROM debian:bullseye

# Install required dependencies
RUN apt-get update && apt-get upgrade && apt-get install -y \
    wget \
    curl \
    gnupg2 \
    software-properties-common

# Add MariaDB repository and key
RUN wget https://downloads.mariadb.com/MariaDB/mariadb_repo_setup && \
    chmod +x mariadb_repo_setup && \
    ./mariadb_repo_setup --mariadb-server-version=10.11.6

# Install MariaDB server
RUN apt-get update && apt-get install -y mariadb-server


# Copy custom configuration and initialization scripts
COPY tools/setup_mdb.sh /setup_mdb.sh
COPY tools/mdb_init.sql /etc/mysql/mdb_init.sql
COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Set appropriate permissions
RUN chmod +x /setup_mdb.sh

RUN mkdir -p /run/mysqld

RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld /var/log/mysql && \
    chmod -R 755 /var/lib/mysql /var/run/mysqld /var/log/mysql

# Expose MariaDB port
EXPOSE 3306

# Create required directories
# RUN mkdir -p /run/mysqld
# RUN chown -R mysql:mysql /var/lib/mysql && chmod -R 755 /var/lib/mysql && chmod 0777 /tmp

# Run initialization script
CMD ["/setup_mdb.sh"]
