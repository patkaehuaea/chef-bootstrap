# Cookbook:: chef-bootstrap
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

Chef::Log.info("platform: #{node['platform']}")
Chef::Log.info("platform_family: #{node['platform_family']}")

node['chef-bootstrap']['packages'].each do |item|
  package item do
    action :install
  end
end

node['chef-bootstrap']['directories'].each do |item, mode_value|
  directory item do
    group node['chef-bootstrap']['user']
    owner node['chef-bootstrap']['user']
    mode mode_value
    action :create
  end
end

node['chef-bootstrap']['homedir']['files'].each do |file,mode_value|
  cookbook_file file do
    group node['chef-bootstrap']['user']
    mode mode_value
    owner node['chef-bootstrap']['user']
    path File.join(node['chef-bootstrap']['base']['path'],file)
    source file
    action :create
  end
end

remote_file File.join(node['chef-bootstrap']['vim']['pathogen']['path'], 'pathogen.vim') do
  group node['chef-bootstrap']['user']
  owner node['chef-bootstrap']['user']
  mode '0755'
  source 'https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim'
end

node['chef-bootstrap']['git']['repos'].each do |name,properties|
  git name do
    properties.each do |property,value|
      unless value.empty?
        send(property,value)
      end
    end
  end
end

node['chef-bootstrap']['fonts']['files'].each do |name,properties|
  remote_file name do
    properties.each do |property,value|
      unless value.empty?
        send(property,value)
      end
    end
  end
end

bash 'reset font cache' do
  code <<-EOH
    fc-cache -vf #{node['chef-bootstrap']['fonts']['path']}
    EOH
end
