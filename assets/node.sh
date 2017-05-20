echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'
echo '*                            *'
echo '*          node.sh           *'
echo '*                            *'
echo '~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~'


# nvm/nodejs
cd ~/
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
source ~/.nvm/nvm.sh
echo "source ~/.nvm/nvm.sh" >> ~/.bashrc

nvm install node
nvm use node

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get -y install yarn

# node devtools
npm install -g webpack grunt-cli --no-bin-links
