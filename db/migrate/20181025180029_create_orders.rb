class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :dt
      t.references :cargo, index: true
      t.integer :weight
      t.float :volume
      t.integer :amount
      t.boolean :frail
      t.boolean :oversized

      t.string :from_city
      t.string :to_city

      t.string :shipper
      t.string :shipper_person
      t.string :shipper_phone
      t.string :shipper_address

      t.string :consignee
      t.string :consignee_person
      t.string :consignee_phone
      t.string :consignee_address

      t.string :payer
      t.text :details

      t.string :person
      t.string :email
      t.references :user, index: true
      t.references :payment, index: true

      t.timestamps
    end
  end
end
