# This recipe enable a nginx-site for rambot.
# useful for HTTP listener: https://github.com/github/hubot#http-listener

include_recipe "nginx"

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
