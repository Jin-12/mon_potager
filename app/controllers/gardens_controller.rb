# frozen_string_literal: true

# app/controllers/gardens_controller.rb
class GardensController < ApplicationController
  before_action :set_garden, only: %i[show]

  def index
    redirect_to static_landing_path unless user_signed_in?
    @search = helpers.evaluate_search_result(params[:search])

    # TODO: decide if update_at better
    @gardens = Garden.order(created_at: :desc).page(params[:page]).per(6)

    @hash = GenerateMapForIndex.new(@search).perform
    @status = Status.last(3).sort_by(&:updated_at).reverse
  end

  # TODO: rename @nearby to @nearbies
  # TODO: rename @hash
  def show
    @comments = @garden.comments.order created_at: :desc
    @user = @garden.user
    @nearby = helpers.locate_nearby_gardens(@garden)
    @hash = GenerateMapForShow.new(@garden, @nearby).perform

    @products = @garden.products
    # TODO: from find_by to .last/.first or get an array
    @status = Status.find_by(user_id: @garden.user_id)

    @how_many_days = (Time.now - @status.updated_at) / 86_400 * 10 if @status
  end

  def new
    @user = current_user
  end

  def create
    User.find(current_user.id).update(first_name: params[:userfirstname], last_name: params[:userlastname])

    @garden = Garden.new(user_id: current_user.id, name: params[:gardenname], adress: params[:adress], city: params[:city], zipcode: params[:zipcode], country: params[:country])
    if @garden.save
      flash.now[:success] = 'Potager bien enregistré !'
      redirect_to garden_path @garden
    else
      flash.now[:warning] = 'Ooops...'
      render :new
    end

    Product.create(name: params[:productname1], garden_id: Garden.last.id)
    Product.create(name: params[:productname2], garden_id: Garden.last.id)
    Product.create(name: params[:productname3], garden_id: Garden.last.id)
    Product.create(name: params[:productname4], garden_id: Garden.last.id)
    Product.create(name: params[:productname5], garden_id: Garden.last.id)
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

  def contactmail
    UserContactMailer.contact_garden(params).deliver_now
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
