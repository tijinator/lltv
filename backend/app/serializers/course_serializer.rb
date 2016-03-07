class CourseSerializer < ActiveModel::Serializer  
  self.root = false
  attributes :id, :level, :title, :details, :duration, :position, :banner_url, :chapters
  # attributes :id, :level, :title, :details, :banner_url, :duration, :released_on, :author, :chapter, :video

  has_many :chapters
  has_one :author

  # def categories
  #   object.categories.order(:position).limit(1).first
  # end

  # def chapter
  # 	object.chapters.first
  # end

  # def video
  # 	Video.find_by_chapter_id(object.chapters.first.id)
  # end

end
