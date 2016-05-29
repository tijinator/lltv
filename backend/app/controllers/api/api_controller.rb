
module Api
	class ApiController < ApplicationController
		include DeviseTokenAuth::Concerns::SetUserByToken
		respond_to :json
		# protect_from_forgery with: :null_session

		# serialization_scope :view_context
		# serialization_scope :user_signed_in?
      	
     #  	before_action :url_ensure
	    # def url_ensure
	    #   if URI(request.host) != URI('lvh.me')
	    #     raise ArgumentError.new, "Invalid request from external domain"
	    #   end
	    # end

	    def home
    		# categories = Category.where.not(homepage_position: nil).order(:homepage_position).limit(5)
    		_categories = Category.includes(:courses).where.not(homepage_position: nil).last(5)
    		categories  = ActiveModel::ArraySerializer.new(_categories, each_serializer: HomeSerializer)
    		populars    = ActiveModel::ArraySerializer.new(Course.where(popular: true).last(4), each_serializer: HomeCourseAuthorSerializer)
	    	render json: {categories: categories, populars: populars}
	    end
	end
end

