class RemoveReleasedFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :released, :datetime
  end
end
