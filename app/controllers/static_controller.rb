class StaticController < ApplicationController

  def landing
    @gardens= Garden.all
    @search_by_zipcode = ""
    unless params[:search_near].nil?
      zipcode = params[:search_near]
      @search_by_zipcode = helpers.locate_by_zipcode(zipcode)
      unless @search_by_zipcode.nil?
        @hash = GenerateMapForLanding.new(@search_by_zipcode[1]).perform
        @landing_map_message = helpers.set_landing_map_message(@search_by_zipcode[1].length)
        render "landing_map" # static_landing_map_path 
      end
    end
  end

end