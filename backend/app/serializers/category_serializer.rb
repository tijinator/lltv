class CategorySerializer < ActiveModel::Serializer
  self.root = false
  # attributes :id, :user_id, :parent_id, :title, :details, :position, :image_file_name, :image_content_type, :image_file_size,
  # :image_updated_at, :html_tab_id, :html_tab_color, :html_color, :homepage_position, :small_image_url, :banner_url

	attributes :id, :user_id, :parent_id, :title, :details, :position, :html_tab_id, :html_tab_color, :html_color, :homepage_position, :small_image_url, :banner_url, :subcategory

  def subcategory
    Category.select('id, parent_id, title').where(parent_id: id)
  end

  def small_image_url
  	object.small_image_url.url
  end
  
  def banner_url
  	object.banner_url.url
  end

end
