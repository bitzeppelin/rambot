# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "bento.precise64"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"
  config.ssh.forward_agent = true

  # Berkshelf
  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = File.join(File.dirname(__FILE__), "deploy", "Berksfile")

  # Chef
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.json = {
      :hubot => {
        :config => {
          "HUBOT_IRC_SERVER" => "irc.freenode.net",
          "HUBOT_IRC_ROOMS" => "#limajs",
          "HUBOT_IRC_PASSWORD" => "",
          "HUBOT_IRC_NICK" => "ratato",
          "HUBOT_LOG_LEVEL" => "debug",
          "HUBOT_IRC_DEBUG" => "true",
          "HUBOT_IRC_UNFLOOD" => "false",
        },
      },
    }
    chef.run_list = [
      "recipe[rambot::default]"
    ]
  end
end
