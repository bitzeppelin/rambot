# Cookbook Name:: rambot
# Recipe:: default

node.set['hubot']['version'] = "2.6.0"
node.set['hubot']['scripts_version'] = "latest"
node.set['hubot']['install_dir'] = "/srv/hubot"
node.set['hubot']['adapter'] = "irc"

# node.set['hubot']['name'] = "tiraniox"

node.set['hubot']['dependencies'] = {
  "twit"              => "latest",
  "cradle"            => "latest",
  "cheerio"           => "latest",
  "hubot-irc"         => ">= 0.1.15",
  "underscore"        => "latest",
}

node.set['hubot']['hubot_scripts'] = %w{
  abstract.coffee
  ascii.coffee
  aww.coffee
  ackbar.coffee
  applause.coffee
  ascii.coffee
  b6n.coffee
  base64.coffee
  beerme.coffee
  botsnack.coffee
  brb.coffee
  calm-down.coffee
  catfacts.coffee
  cheer.coffee
  coin.coffee
  cowsay.coffee
  chuck-norris.coffee
  dnsimple.coffee
  dealwithit.coffee
  devexcuse.coffee
  excuse.coffee
  facepalm.coffee
  gemwhois.coffee
  geocodeme.coffee
  github-status.coffee
  good-night.coffee
  go-for-it.coffee
  grumpycat.coffee
  goooood.coffee
  horse.coffee
  haters.coffee
  hubotagainsthumanity.coffee
  kittens.coffee
  likeaboss.coffee
  look-of-disapproval.coffee
  nice.coffee
  pinkman.coffee
  polite.coffee
  quote.coffee
  rageface.coffee
  rimshot.coffee
  rubygems.coffee
  shipit.coffee
  spin.coffee
  sudo.coffee
  stallman.coffee
  sensitive.coffee
  sweetdude.coffee
  walmart.coffee
  wat.coffee
  wunderground.coffee
  xkcd.coffee
  yoda-quotes.coffee
  yuno.coffee
  zen.coffee
}

# OS packages required by assorted Hubot scripts
%w{ libexpat1 libexpat1-dev libicu-dev }.each do |pkg|
  package pkg do
    action :install
  end
end

include_recipe "hubot"

remote_directory "#{node['hubot']['install_dir']}/scripts" do
  source "scripts"
  files_backup 0
  files_owner node['hubot']['user']
  files_group node['hubot']['group']
  files_mode 00644
  owner node['hubot']['user']
  group node['hubot']['group']
  overwrite true
  mode 00755
  notifies :restart, "service[hubot]", :delayed
end

