class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :user_id
      t.integer :course_id
      t.string :title, null: false
      t.text :details, null: false
      t.integer :duration
      t.integer :position
      t.timestamps
    end

    add_index :chapters, :title
    add_index :chapters, :details
  end
end