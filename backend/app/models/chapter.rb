class Chapter < ActiveRecord::Base
  belongs_to :parent, class: 'Chapter'
  has_many :children, class: 'Chapter', foreign_key: :parent_id

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end