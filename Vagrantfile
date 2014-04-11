# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|

  config.vm.box = "dev-box"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-1310-x64-virtualbox-puppet.box"
  config.vm.network :private_network, ip: "192.168.56.10"
  # config.vm.network :public_network
  # config.ssh.forward_agent = true
  config.vm.synced_folder "./sourcecode", "/var/www/sourcecode"

  config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
      vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path     = "manifests"
    puppet.manifest_file      = "site.pp"
    puppet.module_path        = "modules"
    # puppet.options          = "--verbose --debug"
  end

end
