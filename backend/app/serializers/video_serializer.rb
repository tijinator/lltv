class VideoSerializer < ActiveModel::Serializer
  self.root = false
  attributes :video_url, :title, :details, :transcript, :faqs, :position

# delegate :russel, to: :scope

  def video_url
    unless scope
      object.position == 1 ? object.video_url.url : nil
    else
      object.video_url.url
    end
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

  # 	if scope
  # 		data
  # 	else
  #     puts "*"*100
  #     data
  # 	end
  # end

  # def owner?
  # 	scope
  # end

end
