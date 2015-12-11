class CreateItemCategories < ActiveRecord::Migration
  def change
    create_table :item_categories do |t|
      t.references :categorizable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
