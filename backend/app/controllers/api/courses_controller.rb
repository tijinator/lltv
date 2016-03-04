class Api::CoursesController < Api::ApiController

  def featured_course
    if params[:category_id]
    else
      render json: CourseSerializer.new(Course.where({featured: true}).first)
    end
  end

  def index
    # render json: Course.where("id > 0"), root: false
    render json: Course.all, root: false
  end

  def show
    if c = Course.find_by(id: params[:id])
      render json: CourseSerializer.new(c), root: false
    else
      render json: error_message('db'), root: false
    end
  end

end
