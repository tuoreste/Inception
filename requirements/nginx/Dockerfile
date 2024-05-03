#base image debian
FROM debian:latest

#updates index of the package manager &&
#installs nginx webserver(main service) with its dependencies without prompting for confirmation
#Note that openssl is a toolkit to implement Secure Sockets Layer(SSL) or Transport Layer Security(TLS) protocols for secure communication over networks.
#TLS is the current version of SSL
RUN apt-get update && apt-get install -y openssl nginx

#we first make a directory and name it ssl
#then using the toolkit openssl command (openssl req)
#we generate a new cert signing request (CSR) along with a private key
#and newkey rsa:4096 specifies that a new RSA private key of 4096 bits should be generated along with the CSR(cert).
#-x509 to specify the output will be self signed cert rather than certificate signing request
#-sha256 to specify the -sha256 hash algorithm in generating the certificate
#-days 365 to specify the validity period of the cert
#-nodes to specify that it shouldn't be encrypted with a paraphrase
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/nginx/ssl/otuyishi.crt \
		-keyout /etc/nginx/ssl/otuyishi.key \
		-subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42 Heilbronn/OU=otuyishi/CN=otuyishi/" \
		-addtext "tls_feature = status_request, status_request_v2, status_request_v3"

#let's make a copy of the local folder of our nginx configs into the container of this image
COPY ./conf/nginx.conf /etc/nginx/conf.d

#now create a temporary directory for storing runtime files by nginx, the -p cmd flag to create intermediate directories (such as run in this case). In case (run) does not exist therefore avoid the error
RUN mkdir -p /run/nginx

#Obligated port, where the container listens on specific network port at runtime. In this case, EXPOSE 443.
EXPOSE 443

#start nginx, our main service in this image creation
CMD [ "nginx", "-g", "daemon off;" ]
