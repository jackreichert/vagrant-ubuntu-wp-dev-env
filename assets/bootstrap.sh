echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                                *'
echo '*          bootstrap.sh          *'
echo '*                                *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

# git
apt-add-repository ppa:git-core/ppa
apt-get update
apt-get install git

# dev tools
apt-get install -y build-essential libssl-dev libffi-dev

# sendmail install and configure 
apt-get install -y sendmail
yes | sendmailconfig
