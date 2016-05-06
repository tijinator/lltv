class CategorySerializer < ActiveModel::Serializer

	attributes :id, :user_id, :parent_id, :title, :details, :position, :html_tab_id, :html_tab_color, :html_color, :homepage_position, :small_image_url, :banner_url, :subcategory

	def subcategory
    	Category.select('id, parent_id, title').where(parent_id: object.id)
  	end


	def small_image_url
  		object.small_image_url.url
  	end
  
  	def banner_url
  		object.banner_url.url
  	end
	
end