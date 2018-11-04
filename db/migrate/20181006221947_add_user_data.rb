class AddUserData < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, :limit => 20
    add_column :users, :family, :string, :limit => 20
    add_column :users, :born, :date
    add_column :users, :phone, :string, :limit => 11
  end
end
