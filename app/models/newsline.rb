class Newsline < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :branch
end
