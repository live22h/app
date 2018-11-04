class PersonsController < ApplicationController
  before_action :authenticate_user!
  def profile
    @title = "Личный кабнет"

    @user_orders = Order.where(user_id: current_user.id)
  end
end
