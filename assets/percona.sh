# percona
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
sudo bash -c 'echo deb http://repo.percona.com/apt trusty main >> /etc/apt/sources.list'
sudo bash -c 'echo deb-src http://repo.percona.com/apt trusty main >> /etc/apt/sources.list'
sudo apt-get -y dist-upgrade && sudo apt-get -y update && sudo apt-get -y upgrade
echo "percona-server-server-5.6 percona-server-server/root_password password root" | sudo debconf-set-selections
echo "percona-server-server-5.6 percona-server-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get install -qq -y percona-server-server-5.6 percona-server-client-5.6

# restart after reconfig
sudo service mysql restart
