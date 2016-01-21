class CourseSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :category, :title, :details, :banner_url

  def category
    object.categories.order(:position).limit(1).first
  end
end