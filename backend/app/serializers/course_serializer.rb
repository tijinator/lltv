class CourseSerializer < ActiveModel::Serializer  
  self.root = false
  attributes :id, :level, :title, :details, :duration, :position, :banner_url, :chapters
  # attributes :id, :level, :title, :details, :banner_url, :duration, :released_on, :author, :chapter, :video

  has_many :chapters, serializer: ChapterSerializer
  has_one :author

  # def categories
  #   object.categories.order(:position).limit(1).first
  # end

  # def chapter
  # 	@chapters = object.chapters.all
  # end

  # def video
  # 	Video.find_by_chapter_id(object.chapters.first.id)
  # end

end