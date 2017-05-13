echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                                   *'
echo '*          clean-update.sh          *'
echo '*                                   *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

apt-get clean all
apt-get update
apt-get -y upgrade --with-new-pkgs
apt-get -y dist-upgrade
apt-get -y autoremove
