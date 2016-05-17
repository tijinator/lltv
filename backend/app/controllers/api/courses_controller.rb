class Api::CoursesController < Api::ApiController

  def featured_course
    if params[:category_id]
    else
      render json: CourseSerializer.new(Course.where({featured: true}).first)
    end
  end

  def index
    render json: Course.all.order('id ASC'), each_serializer: CategoryCoursesSerializer, root: false

    # render json: Course.all, each_serializer: CoursesSerializer, root: false
    # render json: Course.all, root: false
    # render json: Course.where("id > 0"), root: false
    # render json: CoursesSerializer.new(courses), root: false
  end

  def show
    if c = Course.includes(:chapters).find(params[:id])
      render json: CourseSerializer.new(c, :scope => course_permission(c.id)), root: false
        # render json: CourseNoPermissionSerializer.new(c), root: false
    else
      render json: error_message('db'), root: false
    end
  end

private
  def course_permission(id)
    current_user_permission = user_signed_in? ? current_user.course_permissions.pluck(:course_id).include?(id) : false
  end

end

