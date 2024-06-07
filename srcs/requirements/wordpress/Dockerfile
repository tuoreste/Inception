FROM debian:bullseye

# Install dependencies
RUN apt-get update && apt-get install -y php php7.4-fpm wget php-mysqli netcat

# Create necessary directories
RUN mkdir -p /var/www/wordpress /run/php

# Download and set up WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Download WordPress core files
RUN wp core download --path=/var/www/wordpress --version=6.5.2 --allow-root

# Copy setup script
COPY ./tools/setup_wp.sh /tools/setup_wp.sh
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN chmod +x /tools/setup_wp.sh

# Run the setup script
CMD ["./tools/setup_wp.sh"]
