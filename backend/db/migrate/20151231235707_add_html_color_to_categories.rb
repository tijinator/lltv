class AddHtmlColorToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :html_color, :string
  end
end
