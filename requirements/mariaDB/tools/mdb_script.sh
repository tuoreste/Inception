#!/bin/bash

#start_mariadb
#setup_database_and_user
#stop_mariadb
#start_mariadb_foreground

start_mariadb() {
	echo "Starting MariaDB service ..."
	service mysql start
	if [ $? -ne 0]; then
		echo "Failed to start MariaDB service."
		exit 1
	fi
	sleep 5
}

setup_db_n_user() {
	echo "Setting up database and user ..."
	SQL_FILE=$(tmp) {
		echo "CREATE DATABASE IF NOT EXISTS \'$DB_NAME\';"
		echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
		echo "GRANT ALL PRIVILEGES ON \'$DB_NAME\'.* TO '$DB_USER'@'%';"
		echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';"
		echo "FLUSH PRIVILEGES;"
	} > "$SQL_FILE"
	mysql < "$SQL_FILE"
	if [ $? -ne 0 ]; then
		echo "Failed to execute SQL commands."
		rm "$SQL_FILE"
		exit 1
	fi
	rm "$SQL_FILE"
}

stop_mariadb() {
	echo "Starting MariaDB service ..."
	if [ -f /var/run/mysqld/mysqld.pid ]; then
		kill $(cat /var/run/mysqld/mysqld.pid)
		if [ $? -ne 0 ]; then
			echo "Failed to stop MariaDB service."
			exit 1
		fi
	fi
}

start_mariadb_foreground() {
	echo "Starting MariaDB in the foreground..."
	mysqld
}
