class AddOrderForStatus < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :status, index: true
  end
end
