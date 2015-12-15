class Admin::UserAdminController < ApplicationController
  def update
    user = User.find(params[:id])
    user.update_attributes(user_params)
    redirect_to '/users'
  end

  private

  def user_params
    u_params = params.require(:user).permit(:role)
    # u_params[:role] = u_params[:role].to_i if u_params[:role]
    return u_params
  end
end