class CreateNewslines < ActiveRecord::Migration[5.2]
  def change
    create_table :newslines do |t|
      t.string      :image,     :limit => 255
      t.string      :content,   :limit => 150
      t.integer     :position,  default: 1
      t.belongs_to  :branch,    index: true
      t.timestamps
    end
  end
end
