class Admin::AdminController < ApplicationController
  include RolesHelper
  layout 'sb2'

  before_action :admin_nav_setup
  before_action :authenticate_user!, except: [:home]
  # before_filter :require_data_entry


protected

  def admin_nav_setup
    @courses = Course.all.order(:position)
    @level = 2
  end
  
end