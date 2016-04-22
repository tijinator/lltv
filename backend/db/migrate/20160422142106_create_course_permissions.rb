class CreateCoursePermissions < ActiveRecord::Migration
  def change
    create_table :course_permissions do |t|
      t.integer :user_id
      t.integer :course_id
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :active
      t.integer :order_id
      t.datetime :order_date

      t.timestamps null: false
    end
  end
end
