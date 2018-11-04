class AddRemoveKladrId < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :city_kladr_id
    add_column :cities, :kladr_id, :string, :limit => 20
  end
end
