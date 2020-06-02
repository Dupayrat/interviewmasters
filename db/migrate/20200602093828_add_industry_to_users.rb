class AddIndustryToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :industry, :string
  end
end
