class ApplicationController < ActionController::Base
  include RolesHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html, :json
  layout :layout_by_resource

  def after_sign_in_path_for(user)
    if user.role > 0
      'http://admin.lltv.com:3000/'
    else
      redirect_to :root
    end
  end

  def after_sign_out_path_for(user)
    redirect_to :root
  end

  def lltv
    render 'layouts/application'
  end

  def admin_logged_in
    unless current_user
      respond_to do |format|
        format.html do
          flash[:alert] = "Please log in to view this page."
          redirect_to '/'
        end

        format.json { render status: 401, json: {errmsg: "Unauthorized"} }
      end
    end
  end

  def require_data_entry
    unless current_user && current_user.role >= RolesHelper.code('Data Entry')
      redirect_to root_url(host: request.domain)
    end
  end

  def require_publisher
    unless current_user && current_user.role >= RolesHelper.code('Publisher')
      redirect_to courses_path
    end
  end

  def require_superuser
    unless current_user && current_user.role >= RolesHelper.code('Superuser')
      redirect_to courses_path
    end
  end

  protected

  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end

  # def verified_request?
  #   super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  # end
end