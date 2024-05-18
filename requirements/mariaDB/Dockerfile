#base image debian
FROM debian:latest

RUN apt-get update && apt-get install -y --no-cache mariadb mariadb-client

EXPOSE 3306

HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD [ "mariadb" ]
