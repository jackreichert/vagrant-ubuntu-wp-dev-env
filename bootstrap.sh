# percona
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
sudo bash -c 'echo deb http://repo.percona.com/apt trusty main >> /etc/apt/sources.list'
sudo bash -c 'echo deb-src http://repo.percona.com/apt trusty main >> /etc/apt/sources.list'
sudo apt-get -y dist-upgrade && sudo apt-get -y update && sudo apt-get -y upgrade
echo "percona-server-server-5.6 percona-server-server/root_password password root" | sudo debconf-set-selections
echo "percona-server-server-5.6 percona-server-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get install -qq -y percona-server-server-5.6 percona-server-client-5.6

# nginx
sudo apt-get install -y nginx

# install php
sudo apt-get install -y php5-common php5-mysql php5-xmlrpc php5-cgi php5-curl php5-gd php5-cli php5-fpm php-apc php5-dev php5-mcrypt  php5-tidy

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
	access_log /var/log/nginx/jr-access.log;
	error_log /var/log/nginx/jr-error.log warn;
    
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
index   index.php;

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

(
sudo cat << 'EOF'
<?php phpinfo();
EOF
) > /var/www/html/play/index.php

# files are getting corrupted turn sendfile off
sudo sed -i 's/sendfile on/sendfile off/g' /etc/nginx/nginx.conf

# restart after reconfig
sudo service nginx restart 
sudo service php5-fpm restart
sudo service mysql restart

# git
sudo apt-get -y install git

# nodejs prep
sudo apt-get install -y python-software-properties
sudo apt-get install -y build-essential
sudo su -c "gem install sass" 