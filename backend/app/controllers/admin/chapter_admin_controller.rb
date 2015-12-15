class Admin::ChapterAdminController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    render 'admin/chapters', layout: 'admin'
  end
end