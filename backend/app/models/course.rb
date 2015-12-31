class Course < ActiveRecord::Base
  belongs_to :author

  has_many :chapters

  has_many :tags, through: :item_tags, source: :taggable, source_type: 'Tag'
  has_many :categories, through: :item_categories, source: :categorizable, source_type: 'Category'

  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end