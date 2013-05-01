
# hubot
default['hubot']['version'] = "v2.3.4"
default['hubot']['scripts_version'] = "2.4.1"
default['hubot']['install_dir'] = "/opt/hubot"
default['hubot']['user'] = "hubot"
default['hubot']['group'] = "hubot"

default['hubot']['name'] = "rambot"
default['hubot']['config'] = Hash.new
default['hubot']['adapter'] = 'irc'
default['hubot']['dependencies'] = Hash.new
default['hubot']['hubot_scripts'] = Array.new

default['hubot']['port'] = 8080
default['hubot']['server_name'] = "rambot.#{node['hostname']}"

# Rambot specific env variables
default['hubot']['env'] = {
  'HUBOT_IRC_NICK'      => 'interstella',
  'HUBOT_IRC_ROOMS'     => '#hubot',
  'HUBOT_IRC_SERVER'    => 'irc.freenode.net',
  'HUBOT_IRC_PASSWORD'  => '',
  'HUBOT_IRC_UNFLOOD'   => 'false',
}
