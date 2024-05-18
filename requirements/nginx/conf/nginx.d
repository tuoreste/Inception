#configurations directives
server
{
	#Listen for HTTP connections on port 443
	listen 443 ssl;

	#Listen for IPv6 HTTP connection on port 443
	listen [::]: 443 ssl;

	#configure server name
	server_name otuyishi.42.fr;

	#enable ssl/tls
	ssl_certificate /etc/nginx/ssl/otuyishi.crt

	#protocols to be used with keys of ssl
	ssl_protocols TLSv1.3;
	ssl_certificate_key /etc/nginx/ssl/otuyishi.key

	#configurations of root directory
	root /var/www/html;
	index index.php index.nginx-debian.html;
}
