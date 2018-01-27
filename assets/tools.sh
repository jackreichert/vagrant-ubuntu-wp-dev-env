echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                            *'
echo '*          tools.sh          *'
echo '*                            *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'

# nodejs
sudo apt-get install -y npm

# node devtools
sudo npm install -g webpack grunt

cd ~/
# wp-cli http://wp-cli.org
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
wp --info

# phpunit https://github.com/sebastianbergmann/phpunit
wget https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
sudo mv phpunit.phar /usr/local/bin/phpunit
phpunit --version
