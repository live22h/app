class AddUserPrivacy < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :privacy, :boolean
  end
end
