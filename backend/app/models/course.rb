class Course < ActiveRecord::Base
  mount_uploader :banner_url, CourseUploader
  belongs_to :author

  has_many :chapters

  has_many :item_tags, as: :taggable
  has_many :tags, through: :item_tags

  # Course => item_categories and item_categories => Categorizable
  has_many :categories, through: :item_categories
  has_many :item_categories, as: :categorizable

  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
