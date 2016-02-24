class Category < ActiveRecord::Base
	
  belongs_to :parent, class_name: 'Category'
  has_many :children, class_name: 'Category', foreign_key: :parent_id

  has_many :courses, through: :item_categories, source_type: 'Course', source: :categorizable
  has_many :item_categories

end