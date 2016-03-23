class Users::SessionsController < Devise::SessionsController
  # skip_before_filter :require_no_authentication
  # before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
      user = User.find_by_email(params[:user][:email])
      if user.role >= RolesHelper.code('Data Entry')
        super
      else
        @user = User.new
        render 'users/sessions/new', layout: 'admin'
      end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

end
