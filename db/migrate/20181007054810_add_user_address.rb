class AddUserAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string, :limit => 150
    add_column :users, :region_kladr_id, :string, :limit => 15
  end
end
