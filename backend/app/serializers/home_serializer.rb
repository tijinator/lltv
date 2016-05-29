class HomeSerializer < ActiveModel::Serializer
  self.root = 'category'
  attributes :id, :title, :courses
  has_many :courses, serializer: HomeCourseAuthorSerializer

  def courses
  	object.courses.last(4)
  end

end