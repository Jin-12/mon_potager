class GardensController < ApplicationController
    def index
    end

    def show
        @garden = Garden.find_by(user_id: current_user.id)
        @products = @garden.products
    end

    def create
    end

    def edit
        @garden = Garden.find_by(user_id: current_session.id)
    end

    def destroy
    end

end
