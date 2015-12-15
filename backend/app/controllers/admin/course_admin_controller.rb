class Admin::CourseAdminController < ApplicationController
  def index
    @current_user = current_user
    @course = Course.new
    @courses = Course.all
    render 'admin/courses', layout: 'admin_logged'
  end

  def create
    Course.create!(course_params.merge({user_id: current_user.id}))
    redirect_to courses_url
  end

  private

  def course_params
    params.require(:course).permit(:name, :image, :description, :rank)
  end
end