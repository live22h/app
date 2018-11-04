class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cargo
  belongs_to :payment
end
