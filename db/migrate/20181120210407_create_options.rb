class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string      :name,     :limit => 255
      t.string      :value,    :limit => 255
      t.timestamps
    end
  end
end
