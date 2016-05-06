class Admin::IndexAdminController < Admin::AdminController

  before_action :admin_nav_setup
  before_action :user_signed_in?
  # before_filter :authenticate_user!
  # before_filter :require_data_entry

  def home
    if current_user
      dashboard
      # if current_user.role >= RolesHelper.code('Superuser')
      #   users
      # else
      #   courses
      # end
    else
      @user = User.new
      render 'users/sessions/new', layout: 'admin'
    end
  end

  def dashboard
    @categories = Category.all
    @courses = Course.all
    @chapters = Chapter.all
    @videos = Video.all

    render 'admin/dashboard', layout: 'sb2'
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

protected

  def admin_nav_setup
    @courses = Course.all.order(:position)
    @level = 2
  end

end