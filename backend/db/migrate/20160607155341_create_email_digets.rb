class CreateEmailDigets < ActiveRecord::Migration
  def change
    create_table :email_digets do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
