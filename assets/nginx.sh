echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                                  *'
echo '*             nginx.sh             *'
echo '*                                  *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

# nginx
add-apt-repository -y ppa:chris-lea/nginx-devel
apt-get update
apt-get install -y nginx

# sendfile messes with development environments
sed -i 's/sendfile on/sendfile off/g' /etc/nginx/nginx.conf

# restart after reconfig
service nginx restart


# create missing directories
mkdir -p /var/www/html
mkdir -p /etc/nginx/global

# create nginx config files
cp /vagrant/configs/wordpress.conf /etc/nginx/global/
cp /vagrant/configs/play.conf /etc/nginx/conf.d/

# restart after reconfig
service nginx restart
