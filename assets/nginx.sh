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

# set up self-signed certs
mkdir -p /etc/pki/ssl
cd /etc/pki/ssl
openssl genrsa -out play.lcl.key 2048
openssl req -new -x509 -key play.lcl.key -out play.lcl.cert -days 3650 -subj /CN=play.lcl

# create missing directories
mkdir -p /var/www/html
mkdir -p /etc/nginx/global

# create nginx config files
cp /vagrant/configs/wordpress.conf /etc/nginx/global/
cp /vagrant/configs/play.conf /etc/nginx/conf.d/

# restart after reconfig
service nginx restart
