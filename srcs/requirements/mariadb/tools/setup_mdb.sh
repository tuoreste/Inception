#!/bin/bash

set -o allexport
source ./requirements
set +o allexport

mariadb_init_file="/tools/mdb_init.sql"
bootstrap_file="/tools/bootstrap.sql"

run_bootstrap() {
	cat <<EOF > "$bootstrap_file"
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
FLUSH PRIVILEGES;
EOF
	mariadbd --user=mysql --bootstrap < "$bootstrap_file"
	rm -f "$bootstrap_file"
}

database_exists=$(mariadb -u root -p"${MYSQL_ROOT_PASSWORD}" -e "SHOW DATABASES LIKE '${MYSQL_DATABASE}';" | grep "${MYSQL_DATABASE}")

if [ -z "$database_exists" ]; then
	run_bootstrap
fi

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

exec /usr/bin/mariadbd --user=mysql --datadir="/var/lib/mysql" --init-file="$mariadb_init_file"
