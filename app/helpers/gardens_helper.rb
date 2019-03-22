# frozen_string_literal: true

module GardensHelper
  include Rails.application.routes.url_helpers

  def evaluate_search_result(search_params)
    @results = Garden.search(search_params)
    if @results.empty?
      flash.now[:warning] = "Cette recherche n'a pas donné de résultats"
      return Garden.all
    else
      return @results
    end
  end
  
  def locate_nearby_gardens(location)
    @garden = location
    @garden.nearbys(20)
  end

  def locate_closest_gardens(location)
    @distance_array = [5, 10, 20, 50, 100]
    @location = location
    @closest = []
    i = 0
    until @closest.length >= 3
      @distance = @distance_array[i]
      @closest = Garden.near(@location.coordinates, @distance)
      i = i + 1
      if i == @distance_array.length
        return [@distance, [@location]]
      end
    end
    return [@distance, @closest]
  end

  def locate_by_zipcode(location)
    @search = Geocoder.search(location).select{ |location| location.country == "France"}.first
    if @search.nil?
      flash.now[:warning] = "Code postal non reconnu"
      return nil
    elsif @search.country != "France"
      flash.now[:warning] = "Code postal non existant en France (#{@search.country})"
      return nil
    else
      locate_closest_gardens(@search)
    end
  end

  def set_landing_map_message(integer)
    integer = integer - 1
    if integer == 0
      "Il n'y a pas encore de potager du coin, crée le premier !"
    elsif integer == 1
      "Tu as 1 potager à proximité, rejoins-le !"
    elsif integer >= 2
      "Tu as #{integer} potagers à proximité, rejoins-les !"
    else
      "(You should not see this message...)"
    end
  end
end
