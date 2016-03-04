class Api::CategoriesController < Api::ApiController
  
  def featured_course
    if params[:category_id]
    else
      # require "byebug"; byebug
      # render json: CourseSerializer.new(Course.where({featured: true}).last)
      render json: CourseSerializer.new(Course.where({featured: true}).first)
    end
  end

  def index
    render json: Category.where.not({small_image_url: nil}), root: false
  end

  def show
    category = Category.find(params[:id])
    subcategory = Category.where(parent_id: params[:id])
    render json: {category: category, subcategory: subcategory}, root: false
  end

  def courses
    category = Category.find(params[:id])
    render json: category.courses, root: false
  end
  
end
