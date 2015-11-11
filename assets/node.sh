# nodejs 
cd /home/vagrant 

# nvm / node / npm
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh

# This enables NVM without a logout/login
export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Install a node and alias
nvm install 5.0
nvm alias default 5.0

# devtools
npm install -g yo
npm install -g bower
npm install -g gulp
npm install -g yo generator-wordpress
