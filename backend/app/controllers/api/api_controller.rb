
module Api
	class ApiController < ApplicationController
		protect_from_forgery with: :null_session

		# serialization_scope :view_context
		# serialization_scope :user_signed_in?
      	
     #  	before_action :url_ensure
	    # def url_ensure
	    #   if URI(request.host) != URI('lvh.me')
	    #     raise ArgumentError.new, "Invalid request from external domain"
	    #   end
	    # end
	end
end

