
sudo add-apt-repository -y ppa:ondrej/php5-5.6
sudo apt-get update

# install php
sudo apt-get install -y php5 php5-common php5-mysql php5-xmlrpc php5-cgi php5-curl php5-gd php5-cli php5-fpm php-apc php5-dev php5-mcrypt  php5-tidy

(
sudo cat << 'EOF'
<?php phpinfo();
EOF
) > /var/www/html/play/index.php

# restart after reconfig
sudo service php5-fpm restart
