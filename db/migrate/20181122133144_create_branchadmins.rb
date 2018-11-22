class CreateBranchadmins < ActiveRecord::Migration[5.2]
  def change
    create_table :branchadmins do |t|
      t.references :branch, index: true
      t.references :user, index: true
    end
  end
end
