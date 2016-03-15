class VideoSerializer < ActiveModel::Serializer
  attributes :id, :video_url, :title, :details, :transcript, :faqs, :position
end
