class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.integer :parent_id
      t.string :title
      t.text :details
      t.integer :position
      t.timestamps
    end

    add_index :categories, :user_id
    add_index :categories, :parent_id
    add_index :categories, :title
    add_index :categories, :details
  end
end
