class GardensController < ApplicationController
    def index
        @gardens = Garden.all
    end

    def show
        @garden = Garden.find_by(user_id: current_user.id)
        @products = @garden.products
        @comments = Comment.where(commentable_id: params[:id])
        @favuser = Favorite.where(favoritable_id: params[:id])
    end

    def create
        Garden.create(user_id: current_user.id, name: params[:gardenname], adress: params[:adress])
        if Product.create(name: params[:productname]) do
        Harvest.create(product_id: (Product.last)id, garden_id: (Garden.last)id)
        end
        redirect_to root_path
    end

    def edit
        @garden = Garden.find_by(user_id: current_user.id)
    end

    def destroy
    end
end
