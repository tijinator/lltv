class CategorySerializer < ActiveModel::Serializer
  
  attributes :id, :user_id, :parent_id, :title, :details, :position, :image_file_name, :image_content_type, :image_file_size,
  :image_updated_at, :html_tab_id, :html_tab_color, :html_color, :homepage_position, :small_image_url, :banner_url
  
end
