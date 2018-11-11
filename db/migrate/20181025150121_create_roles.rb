class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name, :string, :limit => 50
      t.timestamps
    end
  end
end
