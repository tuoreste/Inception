#!/bin/bash

#echo "wp-config.php" > "define( 'DB_NAME', 'database_name_here' );\n "

# wp core config --path=/var/www/html \
#     --dbname="${WORDPRESS_DB_NAME}" \
#     --dbuser="${WORDPRESS_DB_USER}" \
#     --dbpass="${WORDPRESS_DB_PASSWORD}" \
#     --dbhost="${WORDPRESS_DB_HOST}" \
#     --allow-root

# sed -i "s/database_name_here/$WORDPRESS_DB_NAME/" /var/www/html/wp-config.php
# sed -i "s/username_here/$WORDPRESS_DB_USER/" /var/www/html/wp-config.php
# sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" /var/www/html/wp-config.php
# sed -i "s/localhost/$WORDPRESS_DB_HOST/" /var/www/html/wp-config.php

# wp core install --path=/var/www/html \
#     --admin_user="${WORDPRESS_ADMIN_NAME}" \
#     --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
#     --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
#     --allow-root


wp config create --force \
					--url=${WP_URL} \
					--dbname=${WORDPRESS_DB_NAME} \
					--dbuser=${WORDPRESS_DB_USER} \
					--dbpass=${WORDPRESS_DB_PASSWORD} \
					--dbhost=mariadb:3306

wp core install --url=${WP_URL} \
				--admin_user=${WORDPRESS_ADMIN_NAME} \
				--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
				--admin_email=${WORDPRESS_ADMIN_EMAIL} \
				--skip-email

wp user create ${WORDPRESS_DB_USER} \
				${WORDPRESS_USER_EMAIL} \
				--user_pass=${WORDPRESS_USER_PASSWORD}

# exec php-fpm7.4 -F 


# wp config create --force \
# 					--url=localhost \
# 					--dbname=wordpress \
# 					--dbuser=user \
# 					--dbpass=123 \
# 					--dbhost=mariadb:3306

# wp core install --url=localhost \
# 				--admin_user=admin \
# 				--admin_password=admin \
# 				--admin_email=xyz@42 \
# 				--skip-email

# wp user create  \
# 				$WORDPRESS_USER_EMAIL \
# 				--user_pass=$WORDPRESS_USER_PASSWORD

sleep 1000
# exec php-fpm7.4 -F