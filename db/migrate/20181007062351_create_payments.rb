class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string  :name, :limit => 20
      t.timestamps
    end
  end
end
