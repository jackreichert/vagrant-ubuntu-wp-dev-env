echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                                *'
echo '*          bootstrap.sh          *'
echo '*                                *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

# dev tools
apt-get install -y build-essential python-software-properties git

# sendmail install and configure 
apt-get install -y sendmail
yes | sendmailconfig
