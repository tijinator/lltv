class ItemCategory < ActiveRecord::Base
  belongs_to :categorizable, polymorphic: true
end