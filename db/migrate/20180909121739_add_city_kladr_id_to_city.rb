class AddCityKladrIdToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :city_kladr_id, :integer
  end
end
