#!/bin/bash
cd /var/www/html
wp core download --allow-root
wp config create --force \
					--url=$WP_URL \
					--dbname=$WORDPRESS_DB_NAME \
					--dbuser=$WORDPRESS_DB_USER \
					--dbpass=$WORDPRESS_DB_PASSWORD \
					--dbhost=mariadb:3306 \
					--allow-root

wp core install --url=$WP_URL \
				--title=$WP_TITLE \
				--admin_user=$WORDPRESS_ADMIN_NAME \
				--admin_password=$WORDPRESS_ADMIN_PASSWORD \
				--admin_email=$WORDPRESS_ADMIN_EMAIL \
				--skip-email \
				--allow-root

wp user create ${WORDPRESS_DB_USER} \
				${WORDPRESS_USER_EMAIL} \
				--user_pass=${WORDPRESS_USER_PASSWORD} \
				--allow-root

wp option update home $WP_URL --allow-root
wp option update siteurl  $WP_URL --allow-root

chown -R www-data:www-data /var/www/html/*
exec php-fpm7.4 -F
