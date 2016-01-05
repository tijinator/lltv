class Api::CategoriesController < ApplicationController
  def featured_course
    if params[:category_id]
    else
      render json: FeaturedCourseSerializer.new(Course.where({featured: true}).first)
    end
  end
end