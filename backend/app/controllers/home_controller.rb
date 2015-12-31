class HomeController < ApplicationController
  def home
    @user = User.new
    render 'homepage', layout: 'home'
  end
end