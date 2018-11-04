class ChangeUserPhone < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone, :string, :limit => 12
  end
end
