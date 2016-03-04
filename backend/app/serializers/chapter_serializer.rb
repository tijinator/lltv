class ChapterSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :title, :details, :duration, :position, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :videos
  has_many :videos
  
end