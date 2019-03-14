class GardensController < ApplicationController
    def index
        @hash = GenerateMapForIndex.new(@gardens).perform
        @gardens = Garden.all
        @search = Garden.search(params[:search])

    end

    def filter
        @search.select.with_index do |e,i|
            for index in 0..(i - 1)
                @search[index].ids == e.ids
                break
            end
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
