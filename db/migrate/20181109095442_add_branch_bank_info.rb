class AddBranchBankInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :branches, :bik, :string, :limit => 9
    add_column :branches, :bank, :string, :limit => 150
    add_column :branches, :rs, :string, :limit => 20
    add_column :branches, :ks, :string, :limit => 20
  end
end
