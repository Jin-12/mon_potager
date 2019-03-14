class GardensController < ApplicationController
    def index
        respond_to do |format|
            format.html do
                @gardens = Garden.all
                @search = params[:search]
                if @search.present?
                    @name = @search["name"]
                    @gardens = Garden.where(["name LIKE ?","%#{@search}%"])
                end
                @hash = GenerateMapForIndex.new(@gardens).perform
            end

            format.js
        end
    end

    def new
    end

    def show
        @garden = Garden.find_by(id: params[:id])
        @user = User.find(@garden.user_id)
        @nearby = helpers.locate_nearby_gardens(@garden)
        @hash = GenerateMapForShow.new(@garden, @nearby).perform

        @products = @garden.products
        @status = Status.find_by(user_id:@garden.user_id)

        if @status != nil
          @how_many_days = (Time.now.to_i - @status.updated_at.to_i) / 86400
        end
    end

    def create
        Garden.create(user_id: current_user.id, name: params[:gardenname], adress: params[:adress])
        Product.create(name: params[:productname], garden_id: (Garden.last.id))
        redirect_to root_path
    end

    def edit
        @garden = Garden.find_by(user_id: current_user.id)
        @products = @garden.products
    end

    def update
      @garden = Garden.find_by(user_id: current_user.id)
      @products = @garden.products
      @garden.update(name: params[:gardenname], adress: params[:adress])
      @products.update(name: params[:productname])
      redirect_to (garden_path(@garden))
    end

    def destroy
    end
end
