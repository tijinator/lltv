class CourseNoPermissionSerializer < ActiveModel::Serializer
	self.root = false
    attributes :id, :level, :title, :details, :duration, :position, :banner_url, :chapters, :video

    def banner_url
    	object.banner_url.url
    end

    def chapters
    	@chapters = object.chapters
    end
    
    def video
        object.chapters.where({position: 1})[0].video
    end

end