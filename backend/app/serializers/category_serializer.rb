class CategorySerializer < ActiveModel::Serializer
  
  attributes :id

  def id
  	puts "*"*100
	puts object
  	puts "*"*100
  end

  # has_many :courses
end
