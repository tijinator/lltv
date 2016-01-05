class AddHomepagePositionToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :homepage_position, :integer
  end
end
