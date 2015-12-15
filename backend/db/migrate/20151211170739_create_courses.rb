class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.text :image_url
      t.integer :rank, null: false, default: 0
      t.timestamps
    end
  end
end
