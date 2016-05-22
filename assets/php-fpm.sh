LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
apt-get update

apt-get install -y php5.6 php5.6-bcmath php5.6-cli php5.6-common php5.6-curl php5.6-dev php5.6-fpm php5.6-gd php5.6-json php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-tidy php5.6-xml php5.6-xmlrpc php5.6-zip

(
sudo cat << 'EOF'
<?php phpinfo();
EOF
) > /var/www/html/play/info.php

# restart after reconfig
service php5.6-fpm restart
