class AddBranchToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :branch_id, :integer
  end
end
