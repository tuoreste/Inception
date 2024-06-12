FROM debian:bullseye

#RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get update && apt-get install -y nginx openssl curl

RUN mkdir -p /etc/nginx/ssl && \
	openssl req -nodes -newkey rsa:4096 -x509 -sha256 -days 365 \
	-out /etc/nginx/ssl/otuyishi.crt \
	-keyout /etc/nginx/ssl/otuyishi.key \
	-subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42 Heilbronn/OU=otuyishi/CN=otuyishi/"

COPY ./conf/default /etc/nginx/sites-enabled

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
