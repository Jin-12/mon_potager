# frozen_string_literal: true

module GardensHelper
  include Rails.application.routes.url_helpers

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
      flash[:warning] = "Code postal non reconnu"
      return nil
    elsif @search.country != "France"
      flash[:warning] = "Code postal non existant en France (#{@search.country})"
      return nil
    else
      locate_closest_gardens(@search)
    end
  end

  def set_landing_map_message(integer)
    integer = integer - 1
    if integer == 0
      "Il n'y a pas encore de potagers autour de chez toi, crée le premier !"
    elsif integer == 1
      "Vous avez 1 potager à proximité, rejoins-le !"
    elsif integer >= 2
      "Tu as #{integer} potagers à proximité, rejoins-les !"
    else
      "(You should not see this...)"
    end
  end
end
