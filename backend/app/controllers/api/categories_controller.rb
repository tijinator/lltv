class Api::CategoriesController < ApplicationController
  def featured_course
    if params[:category_id]
    else
      render json: CourseSerializer.new(Course.where({featured: true}).first)
    end
  end

  def index
    render json: Category.where.not({small_image_url: nil}), root: false
  end

  def show
    cat = Category.find(params[:id])
    render json: cat, root: false
  end

  def courses
    category = Category.find(params[:id])
    render json: category.courses, root: false
  end
end