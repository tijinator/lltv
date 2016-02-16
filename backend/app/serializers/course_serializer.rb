class CourseSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :category, :title, :details, :banner_url, :chapter, :video, :author_id, :author

  def category
    object.categories.order(:position).limit(1).first
  end

  def chapter
  	object.chapters.first
  end

  def video
  	Video.find_by_chapter_id(object.chapters.first.id)
  end

  def author

    auth_id = object.author_id
    
    Author.find_by_id(auth_id)
  end


end