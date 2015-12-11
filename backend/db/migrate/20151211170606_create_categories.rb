class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.integer :parent_id
      t.string :name
      t.integer :rank
      t.timestamps
    end

    add_index :categories, :user_id
    add_index :categories, :parent_id
    add_index :categories, :name
    add_index :categories, :rank
  end
end
