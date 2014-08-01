# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos_6_5_85_64"
  config.vm.provision :shell, path: "bootstrap.sh"
  # config.vm.provision "chef_solo" do |chef|
  #   chef.cookbooks_path = "bootstrap"
  # end
end
