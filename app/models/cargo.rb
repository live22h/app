class Cargo < ApplicationRecord
  has_many :orders, dependent: :destroy
end
