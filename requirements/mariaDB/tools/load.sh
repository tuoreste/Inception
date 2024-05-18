#!/bin/bash

set -o allexport
source .env
set +o allexport
mariadb_init_file="/etc/mdb_init.sql"
bootstrap_file="bootstrap.sql"
run_bootstrap() {
    mariadbd --user=mysql --bootstrap < "$bootstrap_file"
    rm -f "$bootstrap_file"
}
sed -i "s/\$DB_ROOT_PASSWORD/${DB_ROOT_PASSWORD}/g" "$mariadb_init_file"
sed -i "s/\$DB_USER/${DB_USER}/g" "$mariadb_init_file"
sed -i "s/\$DB_PASSWORD/${DB_PASSWORD}/g" "$mariadb_init_file"
sed -i "1s/^/CREATE DATABASE IF NOT EXISTS '${DB_NAME}';\n/" "$mariadb_init_file"
cat "$mariadb_init_file" >&2
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
    create_sql_file() {
        echo "Your SQL commands here" > "$bootstrap_file"
    }
    create_sql_file
    run_bootstrap
fi
exec mariadbd --no-defaults --user=root --datadir=/var/lib/mysql --init-file="$mariadb_init_file"
