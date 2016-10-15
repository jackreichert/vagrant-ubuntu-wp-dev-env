# Vagrant Ubuntu WordPress Local Development Environment
**Disclaimer:** This is for a local development environment, for the sake of brevity a number of security best practices have been skipped. I built this to learn more about how to automate my environments. If you choose to use this, your are responsible for the outcome.

## Prerequisites
* [VirtualBox](http://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/downloads)
For more information about Vagrant check out their [Getting started](http://docs.vagrantup.com/v2/getting-started/index.html) page.

## To use
`git clone git@github.com:jackreichert/vagrant-ubuntu-wp-dev-env.git`
`cd vagrant-ubuntu-wp-dev-env`
`vagrant up`
On your host machine add `192.168.33.10  play.lcl` to your hosts file

Will create a WordPress install with login admin:admin

## NOTE: For Upgraders
If you are actively using this, don't git pull, your site won't work as-is. I have updated the file structure of the server so instead of running from /var/www/play, it now runs from /var/www/html. Clone this to a separate folder, vagrant up. Once it's up and running you can move over the files you need.

## Specs
* Ubuntu Xenial 64
* Percona 5.6
* Nginx 1.11
* PHP-fpm 7.0
* wp-cli
* phpunit
* Node/Npm default
* Bower
* Webpack
