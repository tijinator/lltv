#
# Cookbook Name:: basic
# Recipe:: default
#
# Copyright 2014, AsNet Co., Ltd
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "build-essential"

# for rails
package 'libqtwebkit-dev'
package 'libpq-dev'