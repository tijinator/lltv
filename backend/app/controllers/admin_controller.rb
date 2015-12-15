class AdminController < ApplicationController
  include RolesHelper

  before_filter :require_data_entry

  def home
    if current_user.role >= RolesHelper.code('Superuser')
      redirect_to '/courses'
    else
      redirect_to '/users'
    end
  end

  def users
    @user = User.new
    @users = User.order(:role).all #User.where("role > 0")
    render 'admin/users', layout: 'admin_logged'
  end

  def courses
    @current_user = current_user
    @course = Course.new
    @courses = Course.all
    render 'admin/courses', layout: 'admin_logged'
  end
end