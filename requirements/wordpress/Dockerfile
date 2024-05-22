FROM debian:12.0

RUN apt-get update && apt-get install -y php php-fpm wget
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    wp core download --path=/var/www/wordpress --version=6.5.2 --allow-root

RUN mkdir -p /tools

WORKDIR /var/www/wordpress
COPY ./conf/www.conf /etc/php/8.0/fpm/pool.d/www.conf
COPY ./tools/setup_wp.sh /tools/setup_wp.sh


RUN chmod +x /tools/setup_wp.sh
RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress
USER www-data
#WORKDIR /tools

CMD ["/tools/setup_wp.sh"]
