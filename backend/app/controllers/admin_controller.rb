class AdminController < ActionController::Base
  def home
    @current_user = current_user
    @users = User.order(:role).all
    render 'admin/users', layout: 'admin_logged'
  end

  def users
    @user = User.new
    @users = User.order(:role).all #User.where("role > 0")
    render 'admin/users', layout: 'admin'
  end

  def courses
    @current_user = current_user
    @course = Course.new
    @courses = Course.all
    render 'admin/courses', layout: 'admin_logged'
  end

  def show_course
  end
end