class CreateBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :banners do |t|
      t.string :picture, :limit => 255
      t.text :description
      t.string :uri, :limit => 255

      t.timestamps
    end
  end
end
