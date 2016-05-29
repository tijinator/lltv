class HomeCourseAuthorSerializer < ActiveModel::Serializer
  # attributes :id, :title, :author
  attributes :id, :level, :title, :details, :duration, :banner_url, :author
  has_one :author

  def banner_url
  	object.banner_url_url
  end

end