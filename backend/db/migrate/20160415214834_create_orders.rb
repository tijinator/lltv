class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.integer :status
      t.integer :order_total_amount
      t.integer :tax_amount

      t.timestamps null: false
    end
  end
end
