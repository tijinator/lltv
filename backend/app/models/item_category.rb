class ItemCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :categorizable, polymorphic: true
end