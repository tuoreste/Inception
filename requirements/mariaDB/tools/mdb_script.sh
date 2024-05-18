#!/bin/bash

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
		echo "CREATE DATABSE IF NOT EXISTS \'$DB_NAME\';"
		echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
		echo "GRANT ALL PRIVILEGES ON \'$DB_NAME\'.* TO '$DB_USER'@'%';"
	}

}