module Api
	class ApiController < ApplicationController
		protect_from_forgery with: :null_session

		# serialization_scope :view_context
		serialization_scope :user_signed_in?
	end
end

