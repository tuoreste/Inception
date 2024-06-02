#!/bin/bash

set -o allexport
source /tools/.env
set +o allexport

mkdir -p /home/otuyishi/data/wordpress_data
mkdir -p /home/otuyishi/data/nginx_conf
mkdir -p /home/otuyishi/data/ssl_cert
mkdir -p /home/otuyishi/data/mariadb_data

wp core config --path=/var/www/wordpress \
    --dbname="${WORDPRESS_DB_NAME}" \
    --dbuser="${WORDPRESS_DB_USER}" \
    --dbpass="${WORDPRESS_DB_PASSWORD}" \
    --dbhost="${WORDPRESS_DB_HOST}" \
    --allow-root

wp core install --path=/var/www/wordpress \
    --url="https://example.com" \
    --title="My Blog" \
    --admin_user="${WORDPRESS_ADMIN_NAME}" \
    --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
    --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
    --allow-root

chown -R www-data:www-data /var/www/wordpress
