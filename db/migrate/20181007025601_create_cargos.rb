class CreateCargos < ActiveRecord::Migration[5.2]
  def change
    create_table :cargos do |t|
      t.string :name, :limit => 100
      t.boolean :delicate
      t.timestamps
    end
  end
end
