class Admin::ChapterAdminController < Admin::AdminController
  before_filter :require_data_entry
  before_filter :require_publisher, only: [:update_published_status]

  def index
    @current_user = current_user
    @is_publisher = current_user.role >= RolesHelper.code('Publisher')
    @course = Course.find(params[:course_id])
    @chapter = Chapter.new
    @chapters = @course.chapters
    render 'admin/courses', layout: 'sb2'
  end

  def show
    @chapter = Chapter.find(params[:chapter_id])
    @videos = @chapter.videos.order(:position)
    render 'admin/chapter', layout: 'sb2'
  end

  def new
    @chapter = Chapter.new
  end

  def create
    # parent_course = Chapter.find(params[:course_id])
    # parent_course.chapters.create!(chapter_params.merge({user_id: current_user.id}))
    # redirect_to course_chapters_path(parent_chapter)
    @course = Course.find(params[:course_id])
    @chapter = @course.chapters.create(chapter_params.merge({user_id: current_user.id}))
    redirect_to @course
  end

  def edit
    # @chapter = Chapter.find_by_id(params[:id])
    @chapter = Chapter.find(params[:id])

  end

  def update
    @course = Course.find(params[:course_id])
    @chapter = Chapter.find_by_id(params[:id])
    @chapter.update(chapter_params)
    redirect_to @course
  end

  def destroy
    @chapter = Chapter.find_by_id(params[:id])
    @chapter.destroy
    redirect_to :back
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :image, :details, :duration, :position)
  end

  def publish_params
    params.require(:chapter).permit(:published)
  end
end
