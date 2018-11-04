class CreateStorages < ActiveRecord::Migration[5.2]
  def change
    create_table :storages do |t|
      t.integer :branch_id
      t.integer :city_id
      t.string :address, :limit => 150
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
