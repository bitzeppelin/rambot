# -*- mode: ruby -*-
# vi: set ft=ruby :


require 'json'


Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.ssh.timeout       = 120
  config.ssh.max_tries     = 40
  config.ssh.forward_agent = true

  config.vm.network :forwarded_port, guest: 80, host: 8080

  # Berkshelf
  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = File.join(File.dirname(__FILE__), "deploy", "Berksfile")

  # config.vm.synced_folder "../data", "/vagrant_data"

  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end

  config.vm.provision :chef_solo do |chef|
    if File.exists? "rambot.json" # chef solo configuration
      chef.json = JSON.load(File.open("rambot.json"))
    else
      chef.json = {
        :nodejs => {
          :install_method => "package",
        },
      }
    end

    chef.run_list = [
        "recipe[rambot::default]"
    ]
  end

end
