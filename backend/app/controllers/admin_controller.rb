class AdminController < ApplicationController
  include RolesHelper

  # before_filter :authenticate_user!
  before_filter :user_signed_in?
  # before_filter :require_data_entry

  def home
    if current_user
      if current_user.role >= RolesHelper.code('Superuser')
        users
      else
        courses
      end
    else
      @user = User.new
      render 'users/sessions/new', layout: 'admin'
    end
  end

  def users
    @user = User.new
    @users = User.order(:role).all #User.where("role > 0")
    # @courses = Course.all.order(:position)
    # Needs code to get and draw course / chapter dropdown
    render 'admin/users', layout: 'sb2'
  end

  def courses
    @current_user = current_user
    @course = Course.new
    # Needs code to get and draw course / chapter dropdown

    render 'admin/courses', layout: 'sb2'
  end
end