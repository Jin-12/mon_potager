# frozen_string_literal: true

class GardensController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to static_landing_path
    end
    @gardens = Garden.all
    @search = Garden.search(params[:search])
    @hash = GenerateMapForIndex.new(@search).perform
    @status = Status.all.sort_by(&:created_at).reverse
  end

  def show
    @garden = Garden.find_by(id: params[:id])
    @comments = Comment.where(garden_id: @garden.id)
    @comments.all.sort_by(&:created_at)
    @user = User.find(@garden.user_id)
    @nearby = helpers.locate_nearby_gardens(@garden)
    @hash = GenerateMapForShow.new(@garden, @nearby).perform

    @products = @garden.products
    @status = Status.find_by(user_id: @garden.user_id)

    unless @status.nil?
      @how_many_days = (Time.now - @status.updated_at) / 86_400 * 10
    end
  end
  def new
  @user = current_user
  end
  def create
    User.find(current_user.id).update(first_name: params[:userfirstname], last_name: params[:userlastname])

    @garden = Garden.new(user_id: current_user.id, name: params[:gardenname], adress: params[:adress], city: params[:city], zipcode: params[:zipcode], country: params[:country])
    puts "@" * 20
    if @garden.save
      flash.now[:success] = "Potager bien enregistré ! Bravo, top !"
    else
      flash.now[:warning] = "Ooops, comme un blème.."
    end

    Product.create(name: params[:productname1], garden_id: Garden.last.id)
    Product.create(name: params[:productname2], garden_id: Garden.last.id)
    Product.create(name: params[:productname3], garden_id: Garden.last.id)
    Product.create(name: params[:productname4], garden_id: Garden.last.id)
    Product.create(name: params[:productname5], garden_id: Garden.last.id)

    redirect_to garden_path @garden
  end

  def edit
    @garden = Garden.find_by(user_id: current_user.id)
    @products = @garden.products
  end

  def update
    @garden = Garden.find_by(user_id: current_user.id)
    @products = @garden.products

    @garden.update(name: params[:gardenname], adress: params[:adress], city: params[:city], zipcode: params[:zipcode], country: params[:country])

    @products[0].update(name: params[:productname1])
    @products[1].update(name: params[:productname2])
    @products[2].update(name: params[:productname3])
    @products[3].update(name: params[:productname4])
    @products[4].update(name: params[:productname5])

    redirect_to garden_path(@garden)
  end

  def destroy; end
end
