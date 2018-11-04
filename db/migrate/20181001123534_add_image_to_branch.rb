class AddImageToBranch < ActiveRecord::Migration[5.2]
  def change
    add_column :branches, :background, :string, :limit => 255
  end
end
