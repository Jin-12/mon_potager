class ImagesController < ApplicationController
  def create
    @garden = Garden.find(params[:garden_id])
    @garden.images.attach(params[:images])
    redirect_to(garden_path(@garden))
  end

  def destroy
    @garden = Garden.find(params[:garden_id])
    @images = @garden.images
    @images.each do |image|
      redirect_to(garden_path(@garden)) if image.purge
    end
end
end
