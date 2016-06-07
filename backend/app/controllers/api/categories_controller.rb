class Api::CategoriesController < Api::ApiController
  
  # def featured_course
  #   if params[:category_id]
  #   else
  #     # render json: CourseSerializer.new(Course.where({featured: true}).last)
  #     # render json: CourseSerializer.new(Course.where({featured: true}).first)
  #     render json: Category.where(parent_id: nil).order('id'), each_serializer: CategoriesSerializer, root: false
  #   end
  # end

  def index
    # render json: Category.where.not({small_image_url: nil}), root: false
    # render json: CategoriesSerializer.new(Category.all)
    categories = Category.where(parent_id: nil).order('id')
    render json: categories, each_serializer: CategoriesSerializer, root: false
  end

  def show
    category = Category.find(params[:id])
    render json: category, each_serializer: CategorySerializer, root: false

    # subcategory = Category.select('id, parent_id, title').where(parent_id: params[:id])
    # render json: {category: category, subcategory: subcategory}, root: false
    # render json: CategorySerializer.new(category: category, subcategory: subcategory)
    # render json: {category: category, subcategory: subcategory}, each_serializer: CategoriesSerializer
    # render json: CategorySerializer.new(subcategory)
  end

  def all_courses
    courses = []
    category     = Category.find(params[:id]).courses
    subcategory  = Category.where(parent_id: 1).includes(:courses)

    subcategory.each do |s|
      courses << s.courses
    end
    render json: category + courses.flatten, each_serializer: CategoryCoursesSerializer, root: false


    # categories = Category.where(parent_id: params[:id]).collect{ |i| i.as_json(:only => [:id, :title, :banner_url, :author])}
    # courses    = Category.find(params[:id]).courses.collect{ |i| i.as_json(:only => [:id, :title])}
    # render json: courses + categories, root: false

    # render json: category.courses, root: false
    # render json: courses + categories, each_serializer: CategoryCoursesSerializer, root: false
  end

  def courses
    category = Category.find(params[:id])
    # render json: category.courses, root: false
    render json: category.courses, each_serializer: CategoryCoursesSerializer, root: false
  end
  
end
