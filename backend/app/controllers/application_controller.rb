class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include RolesHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  respond_to :html, :json
  layout :layout_by_resource

  before_action :configure_permitted_parameters, if: :devise_controller?

  def error_message(type=nil)
    if type == nil
      return {"messsage" => "Unexpected error occurred"}
    else
      return {"messsage" => "Record not found"}
    end
  end

  def after_sign_in_path_for(user)
    if current_user.role > 0
      redirect_to courses_path
    else
      redirect_to :root
    end
    return
  end

  # def after_sign_out_path_for(user)
  #   redirect_to 'https://google.com'
  # end

  def lltv
    render 'layouts/application'
  end

  def admin_nav_setup
    @courses = Course.all.order(:position)
    @level = 2
  end

  protected

  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :first_name, :last_name]
  end

  # def verified_request?
  #   super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  # end
end