class Admin::ChaptersAdminController < Admin::AdminController
  # before_filter :require_data_entry
  # before_filter :require_publisher, only: [:update_published_status]
  before_action :set_course, only:  [:index, :update, :create]
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  def index
    @chapter = Chapter.new
    @chapters = @course.chapters
    # render 'admin/courses', layout: 'sb2'
  end

  def show
    @videos = @chapter.videos.order(:position)
  end

  def new
    @chapter = Chapter.new
  end

  def create
    # parent_course = Chapter.find(params[:course_id])
    # parent_course.chapters.create!(chapter_params.merge({user_id: current_user.id}))
    # redirect_to course_chapters_path(parent_chapter)

    @chapter = @course.chapters.create(chapter_params.merge({user_id: current_user.id}))
    redirect_to @course
  end

  def edit
  end

  def update
    @chapter.update(chapter_params)
    redirect_to @course
  end

  def destroy
    @chapter.destroy
    redirect_to :back
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_chapter
    @chapter = Chapter.find_by_id(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :image, :details, :duration, :position)
  end

  def publish_params
    params.require(:chapter).permit(:published)
  end
end
