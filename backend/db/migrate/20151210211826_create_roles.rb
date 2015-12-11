class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :rank, null: false, default: 0
      t.string :name
      t.timestamps
    end
  end
end
