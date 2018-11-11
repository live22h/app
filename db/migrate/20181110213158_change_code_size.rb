class ChangeCodeSize < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :code, :string, :limit => 16 
  end
end
