class Api::UsersController < ApplicationController
  def index
    respond_with User.all
  end
end