class Admin::CoursesAdminController < Admin::AdminController
  # before_filter :require_data_entry
  # before_filter :require_publisher, only: [:update_published_status]
  before_action :set_course, except: [:new, :create]
  before_action :set_category, except: [:show, :destroy, :course_popular]

  # def index
  #   # @current_user = current_user
  #   # @is_publisher = current_user.role >= RolesHelper.code('Publisher')
  #   # @course = Course.new
  #   # @children = Course.all
  #   # render 'admin/courses', layout: 'sb2'

  #   # @courses = @category.courses
  #   @courses = @category.courses.order('id')
  #   # render 'admin/courses_admin/index', layout: 'sb2'
  # end

  def new
    @course = Course.new
  end

  def edit
  end

  def show
    @chapters = @course.chapters.order('position ASC')
  end

  def create
    @course = @category.courses.create(course_params.merge({user_id: current_user.id}))
    redirect_to category_path(@category)


    # @course = @category.courses.new(course_params.merge({user_id: current_user.id}))
    # @course = @category.courses.new(course_params)
    # @course.user_id = current_user.id
    # @course = Course.new(course_params)
    # item = ItemCategory.create(categorizable: @course)
    # item.category_id = @category.id
    # item.save
  end

  def update
    # render plain: params
    respond_to do |format|
      if @course.update(course_params)
        if params[:course][:remove_banner_url]
          @course.remove_banner_url! 
          @course.save
        end
        format.html {redirect_to category_path(@category), notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def update
    @course.update_attributes!(course_params)
      redirect_to :back
    # redirect_to category_path(@category)
  end

  def course_popular
      @course.update_attributes!(popular: params[:course])
      render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  # def update_published_status
  #   course.update_attributes!(publish_params)
  #   redirect_to :back
  # end

  def destroy
    @course.destroy
    redirect_to :back
  end


private

  def set_course
      @course = Course.find(params[:id])
  end

  def set_category
      @category = Category.find(params[:category_id])
  end

	def course_params
		params.require(:course).permit(:level, :title, :banner_url, :details, :position, :featured, :published, :duration)
	end

	def publish_params
		params.require(:course).permit(:published)
	end
end
