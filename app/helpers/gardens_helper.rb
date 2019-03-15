module GardensHelper

  def locate_nearby_gardens(garden)
    puts params
    puts "#" * 20
    @garden = garden
    @garden.nearbys(30)
  end

  def locate_closest_gardens(location)
    @distance_array = [2, 5, 10, 20, 50, 100]
    # TODO Check if parm is geocoded, else do it
    @location = location
    @closest = []
    i = 0
    until @closest.length >= 10
      @distance = @distance_array[i]
      puts "*" * 40
      @closest = @location.nearbys(@distance)
      puts "#{@closest.length} within #{@distance} km"
      i = i + 1
      return if i == @distance_array.length
    end
    puts "-" * 40
    puts "#{@closest.length} within #{@distance_array[i-1]} km"
    return [@distance, @closest]
  end

  def locate_by_departement(zipcode)

  end

end
