# nginx
sudo apt-get install -y nginx

# files are getting corrupted turn sendfile off
sudo sed -i 's/sendfile on/sendfile off/g' /etc/nginx/nginx.conf

# restart after reconfig
sudo service nginx restart 


# create missing directories
sudo mkdir -p /var/www/html/play/
sudo mkdir -p /etc/nginx/global/

# create nginx config files
(
sudo cat <<'EOF'
server {
	server_name play.lcl;
	listen   80;
	root /var/www/html/play;
	access_log /var/log/nginx/play-access.log;
	error_log /var/log/nginx/play-error.log warn;
    
	# Permalink rewrite # comment out if using cache
	location / {
		try_files $uri $uri/ /index.php?$args;
	}
	include /etc/nginx/global/wordpress.conf;
}
EOF
) > /etc/nginx/conf.d/play.conf

(
sudo cat <<'EOF'
# WordPress single blog rules.
# Designed to be included in any server {} block.
index index.html index.php;

# Add trailing slash to */wp-admin requests.
rewrite /wp-admin$ $scheme://$host$uri/ permanent;
# Sitemap
rewrite ^/sitemap_index\.xml$ /index.php?sitemap=1 last;
rewrite ^/([^/]+?)-sitemap([0-9]+)?\.xml$ /index.php?sitemap=$1&sitemap_n=$2 last;
# assets
location ~ ^/asset/(.*)$ {
	try_files $uri $uri/ /index.php?$query_string;
}

# Pass all .php files onto a php-fpm/php-fcgi server.
location ~ \.php$ {
	try_files $uri =404;
	include /etc/nginx/fastcgi_params;
	fastcgi_pass unix:/var/run/php5-fpm.sock;
	fastcgi_index index.php;
	fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
	fastcgi_keep_conn on;
	fastcgi_buffers 16 16k; 
	fastcgi_buffer_size 32k;
}
EOF
) > /etc/nginx/global/wordpress.conf

# restart after reconfig
sudo service nginx restart 
