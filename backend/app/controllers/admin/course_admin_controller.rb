# class Admin::CourseAdminController < Admin::AdminController
#   # before_filter :require_data_entry
#   # before_filter :require_publisher, only: [:update_published_status]

#   def new
#     @course = Course.new
#   end

#   def create
#     Course.create!(course_params.merge({user_id: current_user.id}))
#     # redirect_to courses_url
#     # format.html { render :new }

#     render 'admin/course_admin/index', layout: 'sb2'
#   end

#   def index
#     @current_user = current_user
#     @is_publisher = current_user.role >= RolesHelper.code('Publisher')
#     # @course = Course.new
#     @courses = Course.all
#     # render 'admin/courses', layout: 'sb2'
#     render 'admin/course_admin/index', layout: 'sb2'

#   end

#   def show
#     @course = Course.find(params[:id])
#     @chapters = @course.chapters
#     # render 'admin/course', layout: 'sb2'
#   end

#   def edit
#     @course = Course.find(params[:id])
#   end

#   def update_published_status
#     @course = Course.find(params[:id])
#     @course.update_attributes!(publish_params)
#     redirect_to :back

#   end

#   def update
#     @course = Course.find(params[:id])
#     @course.update_attributes!(course_params)
#     # redirect_to :back
#     render 'admin/course_admin/index', layout: 'sb2'

#   end

#   def destroy
#     @course = Course.find(params[:id])
# 		@course.destroy
#     redirect_to :back
# 	end

#   private

#   def course_params
#     params.require(:course).permit(:title, :banner_url, :details, :position, :duration, :author_id)
#   end

#   def publish_params
#     params.require(:course).permit(:published)
#   end
# end
