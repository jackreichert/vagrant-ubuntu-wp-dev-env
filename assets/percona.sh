echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                              *'
echo '*          percona.sh          *'
echo '*                              *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

# percona
cd ~/
wget https://repo.percona.com/apt/percona-release_0.1-4.$(lsb_release -sc)_all.deb
dpkg -i percona-release_0.1-4.$(lsb_release -sc)_all.deb
apt-get -y update

echo "percona-server-server-5.7 mysql-server/root_password password root" | debconf-set-selections
echo "percona-server-server-5.7 mysql-server/root_password_again password root" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get -y install percona-server-server-5.7

# restart after reconfig
service mysql restart

mysql -e "CREATE FUNCTION fnv1a_64 RETURNS INTEGER SONAME 'libfnv1a_udf.so';"
mysql -e "CREATE FUNCTION fnv_64 RETURNS INTEGER SONAME 'libfnv_udf.so';"
mysql -e "CREATE FUNCTION murmur_hash RETURNS INTEGER SONAME 'libmurmur_udf.so';"
sudo mysql -D mysql -e"update user set plugin='mysql_native_password';"
sudo mysql -D mysql -e"flush privileges;"