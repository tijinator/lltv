class AddFeaturedToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :featured, :boolean, null: false, default: false
  end
end
