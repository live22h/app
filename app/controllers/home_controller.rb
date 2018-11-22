class HomeController < ApplicationController
  include GeokitHelper
  def index
      @title = "Грузоперевозки по России от 1 кг"
      @banners = Banner.all
      b = near_branch
      @nearbranch = ""
      if !b.nil?
        @nearbranch = "<div style='position:relative;margin-top:80%;line-height: 1rem;'><b>#{b.name}<b><br>#{b.phone}<div>"
      end
  end
end
