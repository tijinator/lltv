class ItemTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :taggable, polymorphic: true
end