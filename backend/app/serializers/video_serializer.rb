class VideoSerializer < ActiveModel::Serializer
  # attributes :id, chapter_id:, :video_url, :title, :details, :transcript, :faqs, :position
  attributes :id, :video_url, :title, :details, :transcript, :faqs, :position

# delegate :russel, to: :scope

  def video_url
	object.video_url.url
  end
 

  # def can_edit?
  # 	view_context.russel.admin?
  # end

  # def attributes
  # 	data = super
  #   # puts data.videos
  #   # puts "*"*100
  #   # p data
  #   # puts data.class
  #   # p user_signed_in?
  #   # puts "*"*100

  # 	if owner?
  # 		data
  # 	else
  # 		data
  # 	end
  # end

  # def owner?
  # 	scope
  # end

end
