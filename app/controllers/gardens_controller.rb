class GardensController < ApplicationController
    def index
        puts '#' * 60
        @gardens = Garden.where(["name LIKE ?","%#{params[:search]}%"])
        puts @gardens
        @hash = GenerateMapForIndex.new(@gardens).perform
        @status = Status.all.sort_by{ |status| status.created_at }.reverse
        @status.each do |status|
          @how_many_days = (Time.now - status.updated_at) / 86400
        end

    end

    def new
    end

    def show
        @garden = Garden.find_by(id: params[:id])
        @user = User.find(@garden.user_id)
        @hash = GenerateMapForIndex.new([@garden]).perform

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
