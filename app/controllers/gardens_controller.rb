class GardensController < ApplicationController
    def index
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
