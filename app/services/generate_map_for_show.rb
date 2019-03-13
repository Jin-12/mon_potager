class GenerateMapForShow < ApplicationController
  
  def initialize(gardens)
    @gardens = gardens
  end

  def perform
    build_hash
  end

  private

  def build_hash
    @hash = Gmaps4rails.build_markers(@gardens) do |garden, marker|
      marker.lat garden.latitude
      marker.lng garden.longitude
      marker.json({title: garden.name})
      marker.title garden.name
      marker.picture({
          "url": helpers.image_url('carrot.png'),
          "width": 32,
          "height": 32
      })
    end
  end

end