FROM debian:bullseye

RUN apt-get update && apt-get install -y php php7.4-fpm php-gd wget php-mysqli

RUN mkdir -p /var/www/html /run/php

WORKDIR /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
	wp core download --path=/var/www/html --version=6.5.2 --allow-root

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./tools/setup_wp.sh /usr/local/bin/setup_wp.sh
RUN chmod +x /usr/local/bin/setup_wp.sh

RUN chown -R www-data:www-data /var/log/
RUN chown -R www-data:www-data /var/www/html
RUN chown -R www-data:www-data /run/php

USER www-data

EXPOSE 9000

CMD ["/usr/local/bin/setup_wp.sh"]
