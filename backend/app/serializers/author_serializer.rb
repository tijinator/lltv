class AuthorSerializer < ActiveModel::Serializer
  # self.root = false

  attributes :full_name

  def full_name
  	if object
  		"#{object.first_name} #{object.last_name}"
  	else
  		nil
  	end
  end

end