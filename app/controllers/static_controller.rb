class StaticController < ApplicationController

  def landing
    @gardens= Garden.all
    @search_by_zipcode = ""
    unless params[:search_near].nil?
      zipcode = params[:search_near]
      @search_by_zipcode = helpers.locate_by_zipcode(zipcode)
      unless @search_by_zipcode.nil?
        @hash = GenerateMapForIndex.new(@search_by_zipcode[1]).perform
        render 'landing_map'
      end
    end
  end

end