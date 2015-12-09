#
# Cookbook Name:: frontend
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
npm_package "grunt-cli" do 
  action :install
end

npm_package "bower" do 
  action :install
end

npm_package "docpad" do 
  version "6.63"
  action :install
end
