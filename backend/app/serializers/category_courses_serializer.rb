class CategoryCoursesSerializer < ActiveModel::Serializer
	attributes :id, :level, :title, :details, :duration, :banner_url
	has_one :author

	def banner_url
		object.banner_url_url
	end


	# def author
	# 	if a = Author.find(id)
	# 		# object.author
	#       a
	# 	else
	# 		nil
	# 	end
	# end
end
