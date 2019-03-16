class StaticController < ApplicationController

  def landing
    @gardens= Garden.all
    puts "#" * 50
    puts params
    @search_by_zipcode = ""
    unless params[:search_near].nil?
      @search_by_zipcode = helpers.locate_by_zipcode(params[:search_near])
      @hash = GenerateMapForIndex.new(@search_by_zipcode[1]).perform
      puts @search_by_zipcode
      render 'landing_map'
    end
  end

end