# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Rambot Rakefile

require 'json'


task :default => :deploy

task :deploy => [:init] do
  sh "dotcloud push"
end


task :restart, [:service, :instance] do |t, args|
  args.with_defaults(:service => "hubot", :instance => "0")
  sh "dotcloud restart #{args.service}.#{args.instance}"
end


task :env do
  if File.exists?('environment.json')
    env_vars = ''
    JSON.load(File.open('environment.json')).each_pair {|key, value| env_vars << "'#{key}=#{value}' "}
    sh "dotcloud env set #{env_vars}"
  end
end


task :init do
  sh "dotcloud connect --git rambot"
end
