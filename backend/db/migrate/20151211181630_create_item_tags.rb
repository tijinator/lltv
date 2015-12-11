class CreateItemTags < ActiveRecord::Migration
  def change
    create_table :item_tags do |t|
      t.integer :tag_id
      t.references :taggable, polymorphic: true
      t.timestamps
    end

    add_index :item_tags, [:taggable_id, :taggable_type, :tag_id], unique: true, name: :item_tags_index
    add_index :item_tags, [:taggable_type, :tag_id], name: :item_type_tags_index
  end
end
