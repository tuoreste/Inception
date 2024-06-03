FROM debian:12.0

RUN apt-get update && apt-get install -y php php8.2-fpm wget php-mysqli

RUN mkdir -p /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    wp core download --path=/var/www/wordpress --version=6.5.2 --allow-root

RUN mkdir -p /tools

WORKDIR /var/www/wordpress

COPY ./tools/setup_wp.sh /tools/setup_wp.sh

RUN chmod +x /tools/setup_wp.sh

CMD ["/bin/bash", "/tools/setup_wp.sh"]
