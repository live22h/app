class AddRegionKladrBranch < ActiveRecord::Migration[5.2]
  def change
    add_column :branches, :region_kladr_id, :string, :limit => 15
  end
end
