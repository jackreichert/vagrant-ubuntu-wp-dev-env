echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                              *'
echo '*          php-fpm.sh          *'
echo '*                              *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

add-apt-repository -y ppa:ondrej/php
apt-get update

apt-get install -y php7.1 php7.1-bcmath php7.1-cli php7.1-common php7.1-curl php7.1-dev php7.1-fpm php7.1-gd php7.1-json php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-soap php7.1-tidy php7.1-xml php7.1-xmlrpc php7.1-zip

sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 8M/g' /etc/php/7.1/fpm/php.ini

(
sudo cat << 'EOF'
<?php phpinfo();
EOF
) > /var/www/html/info.php

# restart after reconfig
service php7.1-fpm restart && service nginx restart

# incresase upload size
sed -i 's/post_max_size = 8M/post_max_size = 64M/g' /etc/php/7.1/fpm/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 64M/g' /etc/php/7.1/fpm/php.ini

service php7.1-fpm restart