class Payment < ApplicationRecord
  has_many :order, dependent: :destroy
end
