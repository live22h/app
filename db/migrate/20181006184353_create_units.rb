class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :name, :limit => 10
      t.float :factor
      t.timestamps
    end
  end
end
