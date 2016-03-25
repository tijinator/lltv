class Admin::UserAdminController < Admin::AdminController
  before_filter :require_superuser

  def index
    @users = User.order(:role).all
    render 'admin/users', layout: 'sb2'
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(user_params)
    redirect_to :back
    # redirect_to '/users'
  end

private

  def user_params
    params.require(:user).permit(:role)
    # u_params[:role] = u_params[:role].to_i if u_params[:role]
    # return u_params
  end
end