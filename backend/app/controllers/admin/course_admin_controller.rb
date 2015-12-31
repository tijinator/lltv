class Admin::CourseAdminController < ApplicationController
  before_action :admin_nav_setup

  before_filter :require_data_entry
  before_filter :require_publisher, only: [:update_published_status]

  def index
    @type = "Course"
    @current_user = current_user
    @is_publisher = current_user.role >= RolesHelper.code('Publisher')
    @course = Course.new
    @children = Course.all
    @root_level = true
    # @chapters = Chapter.arrange(order: :rank)
    # @level = 1
    render 'admin/courses', layout: 'sb2'
  end

  def create
    Chapter.create!(course_params.merge({user_id: current_user.id}))
    redirect_to courses_url
  end

  def update_published_status
    course = Course.find(params[:id])
    course.update_attributes!(publish_params)
    redirect_to :back
  end

  def update
    course = Course.find(params[:id])
    course.update_attributes!(course_params)
    redirect_to :back
  end

  private

  def course_params
    params.require(:course).permit(:title, :image, :description, :rank, :video)
  end

  def publish_params
    params.require(:course).permit(:published)
  end
end