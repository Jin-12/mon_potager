# frozen_string_literal: true

class GenerateMapForIndex < ApplicationController
  def initialize(gardens)
    @gardens = gardens
  end

  def perform
    build_hash
  end

  def build_hash

    @hash = Gmaps4rails.build_markers(@gardens) do |garden, marker|
      marker.lat garden.latitude
      marker.lng garden.longitude
      marker.json(title: garden.name) unless garden.name.nil?
      marker.title garden.name unless garden.name.nil?
      marker.picture(
        "url": helpers.image_url('carrot.png'),
        "width": 32,
        "height": 32
      )
      marker.infowindow render_to_string(partial: 'gardens/map_info', locals: { garden: garden}, object: garden)
      rescue
        marker.lat garden.latitude
        marker.lng garden.longitude
        marker.picture(
          "url": helpers.image_url('carrot.png'),
          "width": 32,
          "height": 32
        )
        end
  end
end
