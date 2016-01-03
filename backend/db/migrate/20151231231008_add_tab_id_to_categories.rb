class AddTabIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :html_tab_id, :string
    add_column :categories, :html_tab_color, :string
  end
end
