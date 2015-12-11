class Category < ActiveRecord::Base
  belongs_to :parent, class: 'Category'
  has_many :children, class: 'Category', foreign_key: :parent_id
end