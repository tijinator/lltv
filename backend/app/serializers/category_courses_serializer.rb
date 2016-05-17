class CategoryCoursesSerializer < ActiveModel::Serializer
	attributes :id, :level, :title, :details, :duration
	# has_one :author

	# def author
	# 	if a = Author.find(id)
	# 		# object.author
	#       a
	# 	else
	# 		nil
	# 	end
	# end

end