class Video < ActiveRecord::Base
	mount_uploader :video_url, VideoUploader
	belongs_to :chapters
end