echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                              *'
echo '*          php-fpm.sh          *'
echo '*                              *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

add-apt-repository -y ppa:ondrej/php
apt-get update

apt-get install -y php7.0 php7.0-bcmath php7.0-cli php7.0-common php7.0-curl php7.0-dev php7.0-fpm php7.0-gd php7.0-json php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-tidy php7.0-xml php7.0-xmlrpc php7.0-zip

(
sudo cat << 'EOF'
<?php phpinfo();
EOF
) > /var/www/html/info.php

# restart after reconfig
service php7.0-fpm restart
