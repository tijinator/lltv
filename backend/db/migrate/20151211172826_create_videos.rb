class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :chapter_id
      t.string :video_url
      t.string :title
      t.text :details
      t.text :transcript
      t.text :faqs
      t.integer :position
      t.timestamps
    end

    add_index :videos, :chapter_id
    add_index :videos, :title
    add_index :videos, :details
    add_index :videos, :transcript
    add_index :videos, :faqs
  end
end