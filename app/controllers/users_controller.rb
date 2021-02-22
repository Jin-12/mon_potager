# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update]
  before_action :correct_user, only: %i[show edit update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id].to_i)
    @status = Status.where(user_id: @user.id)
    @favorite_gardens = @user.find_favorite_gardens
  end

  def edit; end

  def update
    @user = User.find(params[:id].to_i)
    @user.update(birthdate: params[:birthdate], description: params[:description], first_name: params[:first_name], last_name: params[:last_name])
    redirect_to user_path(@user)
  end

  private

  def correct_user
    @user = User.find(params[:id].to_i)
    if current_user != @user
      flash[:alert] = "Ce profil n'est pas accessible"
      redirect_to root_path
    end
  end
end
