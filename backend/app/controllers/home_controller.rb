class HomeController < ApplicationController
  def home
    @user = User.new
    @categories = Category.where.not(homepage_position: nil).order(:homepage_position).limit(5)
    render 'homepage', layout: 'application'
  end
end