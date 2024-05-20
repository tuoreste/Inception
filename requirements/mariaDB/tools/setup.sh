#!/bin/bash

set -o allexport
source /tools/.env
set +o allexport

mariadb_init_file="/tools/mdb_init.sql"
bootstrap_file="/tools/bootstrap.sql"

run_bootstrap() {
	mariadbd --user=mysql --bootstrap < "$bootstrap_file"
	rm -f "$bootstrap_file"
}

sed -i "s/\$DB_ROOT_PASSWORD/${DB_ROOT_PASSWORD}/g" "$mariadb_init_file"
sed -i "s/\$DB_USER/${DB_USER}/g" "$mariadb_init_file"
sed -i "s/\$DB_PASSWORD/${DB_PASSWORD}/g" "$mariadb_init_file"
sed -i "s/\$DB_NAME/${DB_NAME}/g" "$mariadb_init_file"

cat "$mariadb_init_file" >&2

if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
	create_sql_file() {
		echo "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;" > "$bootstrap_file"
		echo "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" >> "$bootstrap_file"
		echo "FLUSH PRIVILEGES;" >> "$bootstrap_file"
	}
	create_sql_file
	run_bootstrap
fi

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

exec mariadbd --user=mysql --datadir=/var/lib/mysql --init-file="$mariadb_init_file"
