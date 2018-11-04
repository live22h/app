class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.string :name, :limit => 150

      t.timestamps
    end
  end
end
