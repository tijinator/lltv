class AddReleasedToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :released, :datetime
  end
end
