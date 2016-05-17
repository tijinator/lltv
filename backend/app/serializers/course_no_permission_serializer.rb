# class CourseNoPermissionSerializer < ActiveModel::Serializer
# 	self.root = false
#     attributes :id, :level, :title, :details, :duration, :position, :banner_url, :chapters

#     def banner_url
#     	object.banner_url.url
#     end

#     def chapters
#         @chapters = object.chapters
#         {chapters: @chapters, video:@chapters.try(video.to_s) }, root: false
#     end
    
#     def video
#         x = @chapters.where({position: 1})[0].video
#         {id: x.id, 
#          video_url: x.video_url.url, 
#          title: x.title, 
#          details: x.details, 
#          transcript: x.transcript, 
#          faqs: x.faqs}
#     end

#     def video_url
#         unless scope
#           object.position == 1 ? object.video_url.url : nil
#         else
#           object.video_url.url
#         end
#     end

# end