module GardensHelper

  def locate_nearby_gardens(garden)
    puts params
    puts "#" * 20
    @garden = garden
    @garden.nearbys(30)
  end

  def locate_closest_gardens(location)
    @distance = [2, 5, 10, 20, 50, 100]
    @location = location
    @closest = []
    i = 0
    until @closest.length >= 3
      @closest = @location.nearbys(@distance[i])
      i = i + 1
    end
    puts @distance
    puts @closest
    return {@distance[i-1]: @closest} 
  end
end

