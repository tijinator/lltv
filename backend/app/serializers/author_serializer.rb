class AuthorSerializer < ActiveModel::Serializer
  # self.root = false

  attributes :full_name, :avatar, :bio

  def full_name
  	if object
  		"#{object.first_name} #{object.last_name}"
  	else
  		nil
  	end
  end

  def avatar
  	object.avatar_url
  end
  
end