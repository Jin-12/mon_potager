# frozen_string_literal: true

class GenerateMapForIndex < ApplicationController
  def initialize(gardens)
    @gardens = gardens
  end

  def perform
    build_hash
  end

  private

  def build_hash
    puts 'x' * 50 
    p @gardens
    @hash = Gmaps4rails.build_markers(@gardens) do |garden, marker|
      marker.lat garden.latitude
      marker.lng garden.longitude
      marker.json(title: garden.name)
      marker.title garden.name
      marker.picture(
        "url": helpers.image_url('carrot.png'),
        "width": 32,
        "height": 32
      )
      marker.infowindow render_to_string(partial: 'gardens/map_info', locals: { garden: garden })
    end
  end
end
