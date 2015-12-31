class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.integer :author_id
      t.string :level
      t.string :title, null: false
      t.text :details, null: false
      t.integer :duration
      t.integer :position
      t.boolean :published, null: false, default: false
      t.datetime :released_on
      t.timestamps
    end

    add_index :courses, :title
    add_index :courses, :details
  end
end
