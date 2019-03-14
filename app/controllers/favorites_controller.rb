class FavoritesController < ApplicationController
    def create
        Favorite.create(favoritable_type: Garden, favoritable_id: params[:id], user_id: current_user.id)
    end

    def index
        @fav = Favorite.where(user_id: current_user.id)
    end
end
