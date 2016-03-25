class Admin::CoursesAdminController < Admin::AdminController
  before_filter :require_data_entry
  before_filter :require_publisher, only: [:update_published_status]
  layout 'sb2'
  before_action :set_category, only: [:index, :show]

  def index
    # @current_user = current_user
    # @is_publisher = current_user.role >= RolesHelper.code('Publisher')
    # @course = Course.new
    # @children = Course.all
    # render 'admin/courses', layout: 'sb2'

    @courses = @category.courses
  end

  def show
    @course = Course.find(params[:id])
    @chapters = @course.chapters
    # render 'admin/course', layout: 'sb2'
  end

  def create
    Course.create!(course_params.merge({user_id: current_user.id}))
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
	
	def set_category
	  	@category = Category.find(params[:category_id])
	end  

	def course_params
		params.require(:course).permit(:title, :image, :details, :position, :duration, :author_id)
	end

	def publish_params
		params.require(:course).permit(:published)
	end
end