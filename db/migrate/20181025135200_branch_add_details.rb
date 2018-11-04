class BranchAddDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :branches, :organization, :string, :limit => 150
    add_column :branches, :ogrn, :string, :limit => 15
    add_column :branches, :inn, :string, :limit => 15
    add_column :branches, :address, :string, :limit => 150
    add_column :branches, :director, :string, :limit => 50    
  end
end
