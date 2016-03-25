class Category < ActiveRecord::Base
	# mount_uploader :small_image_url, CategoryUploader
	mount_uploader :banner_url, CategoryUploader
	
	belongs_to :parent, class_name: 'Category'
	has_many :children, class_name: 'Category', foreign_key: :parent_id

	has_many :courses, through: :item_categories, source_type: 'Course', source: :categorizable
	has_many :item_categories
end