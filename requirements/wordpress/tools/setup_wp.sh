#!/bin/bash

# Load env vars 4rm .env file
# export $(grep -v '^#' ./tools/.env | xargs)

# Define vars
WORDPRESS_DIR="/var/www/html/wordpress"
# WORDPRESS_DOWNLOAD_URL="https://wordpress.org/latest.tar.gz"
# WORDPRESS_ARCHIVE="latest.tar.gz"

# Check if WP is already installed by checking for wp-config.php
# if [ -f "$WORDPRESS_DIR/wp-config.php" ]; then
# 	echo "WordPress is already installed in $WORDPRESS_DIR."
# 	exit 0
# fi

# Download WP
echo "Downloading WordPress..."
# wget $WORDPRESS_DOWNLOAD_URL -O $WORDPRESS_ARCHIVE

# Extraction of WP
echo "Extracting WordPress..."
# tar -xzf $WORDPRESS_ARCHIVE
# mv wordpress $WORDPRESS_DIR
# rm $WORDPRESS_ARCHIVE

# Create wp-config.php using WP-CLI
echo "Configuring WordPress with WP-CLI..."
# cd $WORDPRESS_DIR
wp config create --dbname=db --dbuser=user --dbpass=123 --dbhost=db:3306 --path=$WORDPRESS_DIR

# Set permissions
echo "Setting permissions..."
# chown -R www-data:www-data /var/www/wordpress
# chmod -R 755 /var/www/wordpress

echo "WordPress installation and configuration completed."
php8-fpm -F
