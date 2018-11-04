class AddBranchKpp < ActiveRecord::Migration[5.2]
  def change
    add_column :branches, :kpp, :string, :limit => 15

  end
end
