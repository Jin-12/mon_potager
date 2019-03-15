class GardensController < ApplicationController
    def index
        @gardens = Garden.all
        @hash = GenerateMapForIndex.new(@gardens).perform
        @search = Garden.search(params[:search])     
        @status = Status.all.sort_by{ |status| status.created_at }.reverse
    end

    def new
    end

    def show
        @garden = Garden.find_by(id: params[:id])
        @user = User.find(@garden.user_id)
        @nearby = helpers.locate_nearby_gardens(@garden)
        @hash = GenerateMapForShow.new(@garden, @nearby).perform
        puts "$" * 60
        @test = helpers.locate_closest_gardens(@garden)
        p @test

        @products = @garden.products
        @status = Status.find_by(user_id:@garden.user_id)

        if @status != nil
          @how_many_days = (Time.now - @status.updated_at) / 86400 * 10
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
