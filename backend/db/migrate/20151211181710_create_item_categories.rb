class CreateItemCategories < ActiveRecord::Migration
  def change
    create_table :item_categories do |t|
      t.integer :category_id
      t.references :categorizable, polymorphic: true
      t.timestamps
    end

    add_index :item_categories, [:categorizable_id, :categorizable_type, :category_id], unique: true, name: :item_categories_index
    add_index :item_categories, [:categorizable_type, :category_id], name: :item_type_categories_index
  end
end
