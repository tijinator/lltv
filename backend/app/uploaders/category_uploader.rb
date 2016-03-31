class CategoryUploader < ApplicationUploader

	process convert: 'png'
	# process resize_to_fill: [1020, 286]
	# process resize_to_fit: [1020, 286]

	# version :small_menu do
	# 	process :resize_to_fill => [168, 128]
	# end

	# def as_json(options = {})
	# 	super.merge('banner_url' => banner_url.as_json[:banner_url], 'small_image_url' => small_image_url.as_json[:small_image_url])
	# end

	# def store_dir
 #    	# "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
 #    	"images/#{model.class.to_s.underscore}"
 #  	end

end