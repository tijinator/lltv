module V1	
	class Api::UsersController < Api::ApiController
	  def index
	    respond_with User.all
	  end
	end
end