class CreateItemTags < ActiveRecord::Migration
  def change
    create_table :item_tags do |t|
      t.references :taggable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
