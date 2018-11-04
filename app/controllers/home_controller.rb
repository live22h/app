class HomeController < ApplicationController
  def index
      @title = "Грузоперевозки по России от 1 кг"
      @banners = Banner.all
  end
end
