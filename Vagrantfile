# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/xenial64"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.hostname = 'play-lcl'

  # nginx ports
  config.vm.network :forwarded_port, guest: 80, host: 8089
  config.vm.network :forwarded_port, guest: 443, host: 4434
  # MySQL
  config.vm.network :forwarded_port, guest: 3306, host: 3307

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./assets", "/vagrant"
  config.vm.synced_folder "./html", "/var/www/html", create: true #, owner: 'vagrant', group: 'www-data', mount_options: ["dmode=775", "fmode=664"] # this only works on vagrant reload

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
  # Customize the amount of memory on the VM:
     vb.memory = "1024"
   end

    config.ssh.forward_agent = true

    # update clean linux before installs
    config.vm.provision :shell, path: "assets/clean-update.sh"

    # dev tools, git, sendmail
    config.vm.provision :shell, path: "assets/bootstrap.sh"

    # python, pip, dev
    config.vm.provision :shell, path: "assets/python.sh"

    # set up nginx
    config.vm.provision :shell, path: "assets/nginx.sh"

    # set up php-fpm
    config.vm.provision :shell, path: "assets/php-fpm.sh"

    # set up percona
    config.vm.provision :shell, path: "assets/percona.sh"

    # node, yarn, grunt-cli
    config.vm.provision :shell, path: "assets/node.sh", privileged: false

    # wp-cli phpunit
    config.vm.provision :shell, path: "assets/tools.sh", privileged: false

    # update clean linux
    config.vm.provision :shell, path: "assets/clean-update.sh"

    # setup wp
    config.vm.provision :shell, path: "assets/setup-site.sh", privileged: false
end
