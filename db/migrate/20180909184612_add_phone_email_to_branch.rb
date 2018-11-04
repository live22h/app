class AddPhoneEmailToBranch < ActiveRecord::Migration[5.2]
  def change
    add_column :branches, :phone, :string, :limit => 12
    add_column :branches, :email, :string, :limit => 30
    add_column :branches, :description, :text
  end
end
