class AddProfileInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :job_title, :string
    add_column :users, :location, :string
    add_column :users, :website, :string
    add_column :users, :company_name, :string
  end
end
