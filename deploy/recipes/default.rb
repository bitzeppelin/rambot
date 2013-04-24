
include_recipe "git"
include_recipe "nginx"
include_recipe "nodejs::install_from_package"


hubot_location = "#{Chef::Config[:file_cache_path]}/hubot"

git hubot_location do
  repository  "git://github.com/github/hubot.git"
  reference   "master"
  revision    node['hubot']['version']
  action      :checkout
  notifies    :run, "execute[build rambot]", :immediately
end

user node['rambot']['user'] do
  comment   "rambot user"
  system    true
  shell     "/bin/false"
end

group node['rambot']['group'] do
  members [node['rambot']['user']]
end

execute "build rambot" do
  cwd   hubot_location
  command <<-EOH
  npm install
  bin/hubot --create #{node['rambot']['install_dir']}
  chown #{node['rambot']['user']}:#{node['rambot']['group']} -R #{node['rambot']['install_dir']}
  chmod 0755 #{node['hubot']['install_dir']}/bin/hubot
  EOH
  environment(
    "PATH" => "#{hubot_location}/node_modules/.bin:#{ENV['PATH']}"
  )
  action :nothing
end

template "#{node['nginx']['dir']}/sites-available/rambot" do
  source "rambot-site.erb"
  owner "root"
  group "root"
  mode 00644
  notifies :reload, 'service[nginx]'
end

nginx_site 'rambot' do
  enable true
end
