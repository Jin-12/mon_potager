# frozen_string_literal: true

# app/controllers/favorites_controller.rb
class FavoritesController < ApplicationController
	# TODO: rename @fav to @favorites
  def index
    @fav = current_user.favorites
  end

  def create
    current_user.favorites.create favoritable: Garden.find(params[:garden_id])
    redirect_to user_path(current_user)
  end
end
