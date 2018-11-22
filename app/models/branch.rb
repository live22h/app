class Branch < ApplicationRecord
  has_many :storage, dependent: :destroy
  mount_uploader :background, ImageUploader
  has_many :banners

  has_many :users, through: :branchadmins
  has_many :newslines
end
