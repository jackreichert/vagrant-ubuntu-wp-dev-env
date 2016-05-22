mkdir -p /var/www/play
cd /var/www/play
wp core download
wp core config --dbname=play_lcl --dbuser=root --dbpass=root --dbhost=localhost
wp db create play_lcl
wp core install --url=play.lcl --title=Playground --admin_user=admin --admin_password=admin --admin_email=admin@example.com

wp theme update --all
wp plugin update --all
