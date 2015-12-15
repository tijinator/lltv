class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :user_id
      t.string :title, null: false
      t.text :description, null: false
      t.text :image_url
      t.text :video_url
      t.integer :rank
      t.timestamps
    end

    add_index :chapters, :title
    add_index :chapters, :description
  end
end
