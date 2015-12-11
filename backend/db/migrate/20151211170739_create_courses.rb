class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :description
      t.text :image_url
      t.integer :rank
      t.timestamps
    end
  end
end
