# frozen_string_literal: true

# app/controllers/favorites_controller.rb
class FavoritesController < ApplicationController
	# TODO: rename @fav to @favorites
  def index
    @fav = current_user.favorites
  end

  # TODO: rename :gardenid
  def create
  	garden = Garden.find params(:gardenid)
    Favorite.create favoritable: garden, user: current_user
    redirect_to gardens_path(garden)
  end
end
