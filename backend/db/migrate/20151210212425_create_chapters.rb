class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :parent_id, default: 0
      t.string :title, null: false
      t.text :description, null: false
      t.text :image_url
      t.text :video_url
      t.integer :rank
      t.timestamps
    end

    add_index :chapters, :parent_id
    add_index :chapters, :course_id
  end
end
