class AuthorUploader < ApplicationUploader
	process convert: 'png'

	process resize_to_fit: [160, 160]
	# process resize_to_fill: [1020, 286]

	# version :small_avatar do
	# 	process :resize_to_fill => [168, 128]
	# end
end