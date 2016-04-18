class Api::CategoriesController < Api::ApiController
  
  def featured_course
    if params[:category_id]
    else
      # require "byebug"; byebug
      # render json: CourseSerializer.new(Course.where({featured: true}).last)
      # render json: CourseSerializer.new(Course.where({featured: true}).first)
      render json: Category.where(parent_id: nil).order('id'), each_serializer: CategoriesSerializer, root: false
    end
  end

  def index
    # render json: Category.where.not({small_image_url: nil}), root: false
    # render json: CategoriesSerializer.new(Category.all)
    render json: Category.where(parent_id: nil).order('id'), each_serializer: CategoriesSerializer, root: false
  end

  def show
    category = Category.find(params[:id])
    subcategory = Category.select('id, parent_id, title').where(parent_id: params[:id])

    # render json: {category: category, subcategory: subcategory}, root: false

    # render json: CategorySerializer.new(category: category, subcategory: subcategory)
    # render json: {category: category, subcategory: subcategory}, each_serializer: CategoriesSerializer

    # render json: CategorySerializer.new(subcategory)
    render json: category, each_serializer: CategorySerializer, root: false
  end

  def courses
    category = Category.find(params[:id])
    render json: category.courses, root: false
  end
  
end
