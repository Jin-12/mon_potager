class GardensController < ApplicationController
    def index
        puts '#' * 60
        @gardens = Garden.all
        puts @gardens
        @hash = Gmaps4rails.build_markers(@gardens) do |garden, marker|
            marker.lat garden.latitude
            marker.lng garden.longitude
            marker.json({title: garden.name})
            marker.picture({
                "url": ActionController::Base.helpers.image_url('carrot.png'),
                "width": 32,
                "height": 32
            })
            marker.infowindow("<em>" + garden.name + "</em> " + garden.id.to_s)
        end
    end

    def show
        @garden = Garden.find_by(user_id: current_user.id)
        @products = @garden.products
    end

    def create
    end

    def edit
        @garden = Garden.find_by(user_id: current_user.id)
    end

    def destroy
    end

end
