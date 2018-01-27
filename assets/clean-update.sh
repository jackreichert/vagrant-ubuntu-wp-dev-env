echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                                   *'
echo '*          clean-update.sh          *'
echo '*                                   *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

export DEBIAN_FRONTEND=noninteractive
apt-get clean all
apt-get update
#apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade --with-new-pkgs
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
#apt-get -y -o Dpkg::Options::="--force-confnew" dist-upgrade
apt-get -y autoremove