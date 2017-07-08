echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                                *'
echo '*          bootstrap.sh          *'
echo '*                                *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

apt install -y software-properties-common

# git
apt-add-repository ppa:git-core/ppa
apt-get update
apt-get install git
git config --global core.fileMode false

# dev tools
apt-get install -y build-essential libssl-dev libffi-dev imagemagick

# sendmail install and configure 
apt-get install -y sendmail
yes | sendmailconfig
