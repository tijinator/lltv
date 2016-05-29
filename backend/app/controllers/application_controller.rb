class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # include DeviseTokenAuth::Concerns::SetUserByToken
  include JsEnv #return Rails.evn to front-end
  # protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  # protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  # protect_from_forgery with: :exception, if: Proc.new { |c| c.request.path_info.include?('auth') }
  
  respond_to :html, :json
  layout :layout_by_resource

  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :user_signed_in?
  helper_method :current_user

  before_action :gg
  def gg
    puts "*"*100
    # puts "HEADERS: #{request.headers['access-token']}"
    # puts "PARAMS: #{request.headers.inspect}"
    # puts "HEADERS: #{request.headers['Authorization']}"
    # puts "HEADERS: #{request.headers.inspect}"
      # puts "Cookie: #{cookies[:userObj]}" if cookies[:userObj]
    if user_signed_in?
      puts "CURRENT_USER IN AUTH: #{current_user}"
    end
    puts "*"*100

  end

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
    # from new devise -v 4.1.1 gem
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :stripe_card_token])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :location, :job_title, :website, :company_name])

    devise_parameter_sanitizer.for(:sign_up) << [:username, :first_name, :last_name, :stripe_card_token]
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :location, :job_title, :website, :company_name]
  end

  # def verified_request?
  #   super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  # end

end
