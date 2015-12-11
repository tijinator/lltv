class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :description
      t.string :video_url
      t.references :videoable, polymorphic: true
      t.timestamps
    end
  end
end
