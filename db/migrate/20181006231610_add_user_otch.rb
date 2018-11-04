class AddUserOtch < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :otch, :string, :limit => 20

  end
end
