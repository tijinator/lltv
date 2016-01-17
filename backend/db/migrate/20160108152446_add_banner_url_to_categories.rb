class AddBannerUrlToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :banner_url, :string
  end
end
