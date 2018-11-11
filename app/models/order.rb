class Order < ApplicationRecord
  scope :empty_results, -> { where(id: '-1') }
  
  belongs_to :user
  belongs_to :cargo
  belongs_to :payment
  belongs_to :status
end
# o = Order.where(code: 'CC-144-CT-493')
