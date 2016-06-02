class Admin::AuthorsController < Admin::AdminController
	before_action :set_author, except: [:create, :index]

	def index
		@author = Author.new
		@authors = Author.all
	end

	def edit
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

	def update
		# render plain: params
		if @author.update(author_params)
	        if params[:author][:remove_avatar]
	          @author.remove_avatar! 
	          @author.save
	        end
	        redirect_to authors_path, notice: 'Author was successfully updated.'
	    else
	    	render :edit
		end
	end

	def destroy
		@author.destroy
		redirect_to :back
	end

private

	def author_params
    	params.require(:author).permit(:first_name, :last_name, :avatar)
  	end

  	def set_author
  		@author = Author.find(params[:id])
  	end

end