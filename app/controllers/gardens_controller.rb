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

        @garden = Garden.find_by(id: params[:id])
        @products = @garden.products
        @status = Status.find_by(user_id:@garden.user_id)
        
        if @status != nil 
          @how_many_days = (Time.now.to_i - @status.updated_at.to_i) / 86400
        end
        
        @harvest = Harvest.where(garden_id: @garden)
        @user = User.find(@garden.user_id)
    end

    def create
    end

    def edit
        @garden = Garden.find_by(user_id: current_user.id)
    end

    def destroy
    end
end
