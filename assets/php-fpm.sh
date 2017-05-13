echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                              *'
echo '*          php-fpm.sh          *'
echo '*                              *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

add-apt-repository -y ppa:ondrej/php
apt-get update

apt-get install -y php7.1 php7.1-bcmath php7.1-cli php7.1-common php7.1-curl php7.1-dev php7.1-fpm php7.1-gd php7.1-json php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-tidy php7.1-xml php7.1-xmlrpc php7.1-zip

(
sudo cat << 'EOF'
<?php phpinfo();
EOF
) > /var/www/html/info.php

# restart after reconfig
service php7.1-fpm restart
