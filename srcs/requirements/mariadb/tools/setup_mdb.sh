#!/bin/bash

# Remove any old MySQL or MariaDB files
rm -rf /var/lib/mysql/*
rm -rf /var/lib/mysql-files /var/lib/mysql-keyring

# Initialize MariaDB data directory
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Start MariaDB in safe mode to initialize it
mysqld_safe --skip-networking &

# Wait for MariaDB to start
sleep 10

# Run the initialization SQL script
mysql -u root < /etc/mysql/mdb_init.sql

# Shutdown MariaDB
mysqladmin -u root shutdown

# Start MariaDB normally
exec mysqld
