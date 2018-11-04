class AddRegionKladrId < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :region_kladr_id, :string, :limit => 20

  end
end
