class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :name, :limit => 25

      t.timestamps
    end
  end
end
