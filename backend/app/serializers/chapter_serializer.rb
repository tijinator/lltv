class ChapterSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :title, :details, :duration, :position, :videos
  has_many :videos

  delegate :user_signed_in?, to: :scope

  # def videos
  #   if user_signed_in?
  #     object.chapters.all
  #   else
  #     object.chapters.where(position: 1)
  #   end
  # end

  # def attributes
  # 	data = super
    # puts data.videos
    # puts "*"*100
    # p data
    # puts "*"*100
  	# if user_signed_in?
  	# 	return data
  	# else
  	# 	return data
  	# end
  # end
  
end