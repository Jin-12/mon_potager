# frozen_string_literal: true

module GardensHelper
  def locate_nearby_gardens(location)
    puts params
    puts '#' * 20
    @garden = location
    @garden.nearbys(30)
  end

  def locate_closest_gardens(location)
    @distance_array = [5, 10, 20, 50, 100]
    @location = location
    @closest = []
    i = 0
    until @closest.length >= 5
      @distance = @distance_array[i]
      @closest = Garden.near(@location.coordinates, @distance)
      i = i + 1
      # returning current array if loop not finished at longest distance in array
      puts "LOCATE CLOSEST ON BREAK RETURNS:"
      puts @closest.empty?
      if i == @distance_array.length
        return [@distance, [@location]]
      end
    end
    puts "\\o/" * 20
    puts "#{@closest.length} within #{@distance_array[i-1]} km"
    puts "LOCATE CLOSEST RETURNS:"
    puts @closest
    return [@distance, @closest]
  end

  def locate_by_zipcode(location)
    @search = Geocoder.search(location).first
    puts "~" * 20
    puts "LOCATE BY ZIPCODE RETURNS:"
    locate_closest_gardens(@search)
    # binding.pry
  end

end
