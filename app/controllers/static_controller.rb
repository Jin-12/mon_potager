class StaticController < ApplicationController

  def landing
    @gardens= Garden.all
    @search = params[:search_near]
    puts "#" * 50
    puts @search
    puts "#" * 50
  end

end