#base image debian
FROM debian:latest

#updates index of the package manager &&
#installs nginx webserver(main service) with its dependencies without prompting for confirmation
#Note that openssl is a toolkit to implement Secure Sockets Layer(SSL) & Transport Layer Security(TLS) protocols for secure communication over networks.
RUN apt-get update && apt-get install -y openssl nginx

RUN mkdir /etc/nginx/tls
