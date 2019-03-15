# frozen_string_literal: true

class FavoritesController < ApplicationController
  def create
    Favorite.create(favoritable_type: Garden, favoritable_id: params[:gardenid], user_id: current_user.id)
    redirect_to gardens_path(params[:gardenid])
  end

  def index
    @fav = Favorite.where(user_id: current_user.id)
  end
end
