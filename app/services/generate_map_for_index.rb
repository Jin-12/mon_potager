class GenerateMapForIndex

  def initialize(gardens)
    @gardens = gardens
    puts "Service here"
    p @gardens
  end

  def perform
    build_hash
  end

  private

  def build_hash
    @hash = Gmaps4rails.build_markers(@gardens) do |garden, marker|
      ac = ActionController::Base.new()
      marker.lat garden.latitude
      marker.lng garden.longitude
      marker.json({title: garden.name})
      marker.picture({
          "url": ac.helpers.image_url('carrot.png'),
          "width": 32,
          "height": 32
      })
      marker.infowindow ac.render_to_string(partial: 'gardens/map_info', locals: {garden: garden})
      print garden.name
      print garden.latitude
    end
  end

end