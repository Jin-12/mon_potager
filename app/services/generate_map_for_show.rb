class GenerateMapForShow < ApplicationController
  
  def initialize(garden, nearby)
    @garden = garden
    @nearby = nearby
    puts @garden
    puts @nearby

  end

  def perform
    build_hash
  end

  private

  def build_hash
    @hash_nearby = Gmaps4rails.build_markers(@nearby) do |garden, marker|
      marker.lat garden.latitude
      marker.lng garden.longitude
      marker.json({title: garden.name})
      marker.title garden.name
      marker.picture({
          "url": helpers.image_url('carrot.png'),
          "width": 32,
          "height": 32
      })
      marker.infowindow render_to_string(partial: 'gardens/map_info_show', locals: {garden: garden})
    end
    @hash_garden = Gmaps4rails.build_markers([@garden]) do |garden, marker|
      marker.lat garden.latitude
      marker.lng garden.longitude
      marker.json({title: garden.name})
      marker.title garden.name
      marker.picture({
          "url": helpers.image_url('carrot_lg.png'),
          "width": 64,
          "height": 64
      })
    end
    puts "=" * 50
    @hash = @hash_nearby + @hash_garden
    p @hash
    return @hash
  end

end