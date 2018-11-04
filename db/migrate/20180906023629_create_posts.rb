class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :title_id
      t.text :message
      t.string :email, :limit => 20

      t.timestamps
    end
  end
end
