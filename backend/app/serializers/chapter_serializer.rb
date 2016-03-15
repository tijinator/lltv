class ChapterSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :title, :details, :duration, :position, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :videos
  has_many :videos

  # delegate :user_signed_in?, to: :scope
  # def attributes
  # 	data = super
  # 	if user_signed_in?
  # 		return data
  # 	else
  # 		return data
  # 	end
  # end
  
end