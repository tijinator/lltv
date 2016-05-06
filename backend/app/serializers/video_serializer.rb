class VideoSerializer < ActiveModel::Serializer
  # attributes :id, chapter_id:, :video_url, :title, :details, :transcript, :faqs, :position
  attributes :id, :video_url, :title, :details, :transcript, :faqs, :position

  def video_url
  	object.video_url.url
  end


end
