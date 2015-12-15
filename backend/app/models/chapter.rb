class Chapter < ActiveRecord::Base
  # belongs_to :parent, class: 'Chapter'
  # has_many :children, class: 'Chapter', foreign_key: :parent_id

  has_ancestry

  has_many :tags, through: :item_tags, source: :taggable, source_type: 'Tag'
  has_many :categories, through: :item_categories, source: :categorizable, source_type: 'Category'

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end