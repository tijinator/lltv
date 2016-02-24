class CourseSerializer < ActiveModel::Serializer
  
  self.root = false

  attributes :id, :category, :title, :details, :banner_url, :chapter, :video

  def category
    object.categories.order(:position).limit(1).first
  end

  def chapter
  	object.chapters.all
  end

  def video
  	Video.find_by_chapter_id(object.chapters.first.id)
  end

end