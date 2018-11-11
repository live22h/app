class CreateBranchdirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :branchdirectors do |t|
      t.belongs_to :user, index: true
      t.belongs_to :branch, index: true
      t.timestamps
    end
  end
end
