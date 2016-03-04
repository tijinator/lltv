class Api::CoursesController < ApplicationController

  def featured_course
    if params[:category_id]
    else
      render json: CourseSerializer.new(Course.where({featured: true}).first)
    end
  end

  def index
    render json: Course.where("id > 0"), root: false
  end

  def show
    if c = Course.find_by(id: params[:id])
      render json: CourseSerializer.new(c), root: false
    else
      render json: error_message('db'), root: false
    end
  end


  # def create
  #Success
  #     render status: 200, json: {
  #       message: "#{activity.kind.capitalize} activity has been Created successfully",
  #       activity: activity
  #     }.to_json

  #fails
  #     render status: 422, json: {
  #       message: "Ouch, smth went wrong, FAILED.",
  #       errors: acitivity.errors
  #     }.to_json
  # end

end