class ChapterSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :title, :details, :duration, :position, :videos
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