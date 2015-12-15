class Admin::ChapterAdminController < ApplicationController
  before_filter :require_data_entry
  before_filter :require_publisher, only: [:update_published_status]

  def index
    @type = "Chapter"
    @current_user = current_user
    @is_publisher = current_user.role >= RolesHelper.code('Publisher')
    @course = Course.find(params[:course_id])
    @chapter = Chapter.new
    @children = @course.children
    render 'admin/courses', layout: 'admin_logged'
  end

  def create
    parent_chapter = Chapter.find(params[:course_id])
    parent_chapter.children.create!(chapter_params.merge({user_id: current_user.id}))
    redirect_to course_chapters_path(parent_chapter)
  end

  def update_published_status
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :image, :description, :rank)
  end

  def publish_params
    params.require(:chapter).permit(:published)
  end
end