class AddSmallImageUrlToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :small_image_url, :string
  end
end
