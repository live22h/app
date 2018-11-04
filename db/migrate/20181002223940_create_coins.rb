class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.integer :user_id
      t.integer :coin, :default => 100

      t.timestamps
    end
  end
end
