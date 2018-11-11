class Branch < ApplicationRecord
  has_many :storage, dependent: :destroy
  mount_uploader :background, ImageUploader
  has_many :banners

  has_many :branchdirectors
  has_many :users, through: :branchdirectors
end
