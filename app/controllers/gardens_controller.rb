class GardensController < ApplicationController
<<<<<<< HEAD
  def show
  end
=======
    def index
    end

    def show
        @garden = Garden.find_by(user_id: current_session.id)
        @products = @garden.products
    end

    def create
    end

    def edit
        @garden = Garden.find_by(user_id: current_session.id)
    end

    def destroy
    end

>>>>>>> aurelien_delivery
end
