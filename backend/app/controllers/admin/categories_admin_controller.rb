class Admin::CategoriesAdminController < Admin::AdminController
	before_action :set_category, only: [:show, :edit, :update, :destroy]
	# layout 'sb2' # render 'admin/category_admin/index'

	def index
		@categories = Category.all.order('id')
		render 'admin/categories_admin/index', layout: 'sb2'
	end

	def new
		@category = Category.new
	end

	def show
	end

	def edit
	end

	def create
		@category = Category.new(category_params)
		respond_to do |format|
			if @category.save
				format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
				format.js {}
			else
				format.html { render :new }
			end
		end
	end

	def update
		respond_to do |format|
			if @category.update(category_params)
				format.html { redirect_to categories_path, notice: 'Category was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@category.destroy
		redirect_to :back
	end

private

	def set_category
      @category = Category.find(params[:id])
    end

	def category_params
		params.require(:category).permit(:user_id, :parent_id, :title, :details, :position, :html_tab_id, :html_tab_color, :html_color, :homepage_position, :small_image_url, :banner_url)
    end

end
