class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title
      t.integer :user_id
      t.references :tagable, polymorphic: true, index: true
      t.integer :position
      t.timestamps
    end

    add_index :tags, :title
  end
end
