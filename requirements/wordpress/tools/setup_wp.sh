#!/bin/bash

# Load environment variables from .env file
export $(grep -v '^#' .env | xargs)

# Define variables
WORDPRESS_DIR="/var/www/html/wordpress"
WORDPRESS_DOWNLOAD_URL="https://wordpress.org/latest.tar.gz"
WORDPRESS_ARCHIVE="latest.tar.gz"

# Check if WordPress is already installed by checking for wp-config.php
if [ -f "$WORDPRESS_DIR/wp-config.php" ]; then
	echo "WordPress is already installed in $WORDPRESS_DIR."
	exit 0
fi

# Download WordPress
echo "Downloading WordPress..."
wget $WORDPRESS_DOWNLOAD_URL -O $WORDPRESS_ARCHIVE

# Extract WordPress
echo "Extracting WordPress..."
tar -xzf $WORDPRESS_ARCHIVE
mv wordpress $WORDPRESS_DIR
rm $WORDPRESS_ARCHIVE

# Create wp-config.php using WP-CLI
echo "Configuring WordPress with WP-CLI..."
cd $WORDPRESS_DIR
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=db:3306 --path=$WORDPRESS_DIR

# Set permissions
echo "Setting permissions..."
chown -R www-data:www-data $WORDPRESS_DIR
chmod -R 755 $WORDPRESS_DIR

echo "WordPress installation and configuration completed."
