class Admin::AuthorsController < Admin::AdminController

	def index
		@authors = Author.all
	end

	def new
		
	end
	
	def create
		@author = Author.new(author_params)
		respond_to do |format|
			if @author.save
				flash[:success] = "Yeah, #{@author.first_name} succsessfully added"
				format.html {redirect_to :back}

				# format.js
				# format.json { render :json => { :data => @author }}
				
				format.json{
					render status: 200, json: {
						message: "Author has been Created successfully",
						data: @author
					}.to_json
				}
			else
				# format.json { render :json => { :error => @author.errors, status: 400 }}
				flash[:danger] = "Ouch, Something went wrong !"
				@authors = Author.all
				format.html{render :index}
				# render :index

				# format.json {
				# 	render status: 422, json: {
				# 		message: "Ouch, smth went wrong, FAILED.",
				# 		errors: @author.errors
				# 	}.to_json
				# }

			end
		end
	end

private

	def author_params
    	params.require(:author).permit(:first_name, :last_name, :avatar)
  	end

end