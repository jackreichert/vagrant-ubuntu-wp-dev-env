echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                                *'
echo '*          bootstrap.sh          *'
echo '*                                *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

# dev tools
apt-get install -y build-essential git  libssl-dev libffi-dev
apt-get install -y python3-software-properties python3-pip python3-dev

# sendmail install and configure 
apt-get install -y sendmail
yes | sendmailconfig
