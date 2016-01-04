class HomeController < ApplicationController
  def home
    @user = User.new
    @categories = Category.limit(5).order(:position)
    render 'homepage', layout: 'application'
  end
end