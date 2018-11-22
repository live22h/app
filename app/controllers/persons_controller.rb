class PersonsController < ApplicationController
  before_action :authenticate_user!
  def profile
    @title = "Личный кабнет"

    @user_orders = Order.where(user_id: current_user.id)

    @roles = current_user.roles
    if current_user.director?
      @branches = current_user.branches
      @storages = Storage.where(:branch_id => @branches)
      @banners = Banner.where(:branch_id => @branches)
    end
    if current_user.admin?
      @branches = Branch.all
      @banners = Banner.all
    end
  end
end
