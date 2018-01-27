echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                              *'
echo '*          php-fpm.sh          *'
echo '*                              *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

add-apt-repository -y ppa:ondrej/php
apt-get update

apt-get install -y php7.2 php7.2-bcmath php7.2-cli php7.2-common php7.2-curl php7.2-dev php7.2-fpm php7.2-gd php7.2-json php7.2-mbstring php7.2-mysql php7.2-soap php7.2-tidy php7.2-xml php7.2-xmlrpc php7.2-zip

(
sudo cat << 'EOF'
<?php phpinfo();
EOF
) > /var/www/html/info.php

# restart after reconfig
service php7.2-fpm restart && service nginx restart

# larger upload sizes
sed -i 's/post_max_size = 8M/post_max_size = 64M/g' /etc/php/7.2/fpm/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 64M/g' /etc/php/7.2/fpm/php.ini

service php7.2-fpm restart