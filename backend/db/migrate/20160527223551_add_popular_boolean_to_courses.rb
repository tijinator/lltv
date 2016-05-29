class AddPopularBooleanToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :popular, :boolean, default: false
  end
end
