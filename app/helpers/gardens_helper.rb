module GardensHelper

  def locate_nearby_gardens(garden)
    puts params
    puts "#" * 20
    @garden = garden
    @garden.nearbys(30)
  end

end
