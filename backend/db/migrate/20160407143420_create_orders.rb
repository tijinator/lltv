class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :amount
      t.string :address
      t.string :address_two
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
