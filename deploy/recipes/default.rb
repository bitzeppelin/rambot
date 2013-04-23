
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


execute "build rambot" do
  cwd   hubot_location
  command <<-EOH
  npm install
  bin/hubot --create #{node['rambot']['install_dir']}
  chmod u+x #{node['rambot']['install_dir']}
  EOH
  environment(
    "PATH" => "#{hubot_location}/node_modules/.bin:#{ENV['PATH']}"
  )
  # action :nothing
end

# cmd "insta"
