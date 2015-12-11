class Course < ActiveRecord::Base
  has_many :tags, through: :item_tags, source: :taggable, source_type: 'Tag'
  has_many :categories, through: :item_tags, source: :categorizable, source_type: 'Category'
end