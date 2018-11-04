class RemoveRoleColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :roles, :string
  end
end
