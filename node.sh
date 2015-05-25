# nodejs 
sudo apt-get install python-software-properties
sudo apt-get install build-essential

# node / npm
curl -sL https://deb.nodesource.com/setup | sudo bash -
curl -sL https://npmjs.org/install.sh | sh
sudo apt-get -y install nodejs
sudo npm update -g npm
npm config set prefix ~/npm
export PATH="$PATH:$HOME/npm/bin"

# devtools
npm install -g yo
npm install -g bower
npm install -g grunt-cli
npm install -g yo generator-wordpress

(
sudo cat << 'EOF'
{
	"url": "http://play.lcl",
	"tablePrefix": "wp_",
	"dbHost": "localhost",
	"dbName": "play",
	"dbUser": "root",
	"dbPass": "root",
	"git": true,
	"submodule": true,
	"wpDir": "core",
	"contentDir": "content",
	"installTheme": false,
	"customDirs": true
}
EOF
) > /var/www/html/play/.yeopress
