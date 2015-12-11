class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :user_id
      t.references :tagable, polymorphic: true, index: true
    end
  end
end
