class Banner < ApplicationRecord
  mount_uploader :picture, ImageUploader
  belongs_to :branch
end
