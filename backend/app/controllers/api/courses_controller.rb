class Api::CoursesController < Api::ApiController

  def featured_course
    if params[:category_id]
    else
      render json: CourseSerializer.new(Course.where({featured: true}).first)
    end
  end

  def index
    render json: Course.all, root: false
    # render json: Course.where("id > 0"), root: false
    # render json: CoursesSerializer.new(Course.all), root: false
  end

  def show
    if c = Course.find(params[:id])
      # puts current_user
      # if current_user.course_permissions.pluck(:course_id).include?(c.id)
          puts "*"*100
          puts current_user
          puts "*"*100
          render json: CourseSerializer.new(c, :scope => current_russel), root: false
      
        # render json: CourseSerializer.new(c), root: false
        # render json: CoursePermissionSerializer.new(c), root: false
    else
      render json: error_message('db'), root: false
    end
  end

private

  def current_russel
    User.new(email: 'Mike@mike.com')
  end

end


# if user_signed_in? && current_user.course_permissions.includes?(c.id)