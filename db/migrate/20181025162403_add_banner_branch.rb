class AddBannerBranch < ActiveRecord::Migration[5.2]
  def change
    add_reference :banners, :branch, index: true
  end
end
