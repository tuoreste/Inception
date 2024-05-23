#!/bin/bash

set -o allexport
source /tools/.env
set +o allexport

wp core config --path=/var/www/wordpress \
    --dbname="${WORDPRESS_DB_NAME}" \
    --dbuser="${WORDPRESS_DB_USER}" \
    --dbpass="${WORDPRESS_DB_PASSWORD}" \
    --dbhost="${WORDPRESS_DB_HOST}" \
    --allow-root

wp core install --path=/var/www/wordpress \
    --url="https://example.com" \
    --title="My Blog" \
    --admin_user="admin" \
    --admin_password="admin_password" \
    --admin_email="admin@example.com" \
    --allow-root

chown -R www-data:www-data /var/www/wordpress
