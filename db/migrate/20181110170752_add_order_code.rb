class AddOrderCode < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :code, :string, :limit => 13
  end
end
