class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.string :name
      t.references :categorizable, polymorphic: true, index: true
    end
  end
end
