class ChangeStarages < ActiveRecord::Migration[5.2]
  def change
    remove_column :storages, :city_id
  end
end
