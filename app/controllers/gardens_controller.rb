# frozen_string_literal: true

class GardensController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to static_landing_path
    end
    @gardens = Garden.all
    @hash = GenerateMapForIndex.new(@gardens).perform
    @search = Garden.search(params[:search])
    @status = Status.all.sort_by(&:created_at).reverse
  end

  def new; end

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

  def create
    Garden.create(user_id: current_user.id, name: params[:gardenname], adress: params[:adress], city: params[:city], zipcode: params[:zipcode], country: params[:country])

    Product.create(name: params[:productname1], garden_id: Garden.last.id)
    Product.create(name: params[:productname2], garden_id: Garden.last.id)
    Product.create(name: params[:productname3], garden_id: Garden.last.id)
    Product.create(name: params[:productname4], garden_id: Garden.last.id)
    Product.create(name: params[:productname5], garden_id: Garden.last.id)
    redirect_to root_path
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
