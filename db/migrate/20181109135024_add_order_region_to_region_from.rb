class AddOrderRegionToRegionFrom < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :kladr_from, :string, :limit => 13
    add_column :orders, :kladr_to, :string, :limit => 13
  end
end
