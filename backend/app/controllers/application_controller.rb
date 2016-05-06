class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  # protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  respond_to :html, :json
  layout :layout_by_resource

  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :user_signed_in?
  helper_method :current_user


  def error_message(type=nil)
    if type == nil
      return {"messsage" => "Unexpected error occurred"}
    else
      return {"messsage" => "Record not found"}
    end
  end

  def lltv
    render 'layouts/application'
  end

protected

  def after_sign_in_path_for(user)
    if user.role > 0
      # redirect_to users_path
      # '/users'
      '/dashboard'
    else
      # redirect_to :root
      '/'
    end
  end

  # def after_sign_out_path_for(user)
  #   redirect_to 'https://google.com'
  # end

  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :first_name, :last_name, :stripe_card_token]
  end

  # def verified_request?
  #   super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  # end
end