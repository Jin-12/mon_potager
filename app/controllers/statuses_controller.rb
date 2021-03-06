# frozen_string_literal: true

class StatusesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @status = Status.all.sort_by(&:created_at)
  end

  def show; end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    Status.create(content: params[:content], user_id: current_user.id)
    redirect_to garden_path(current_user.gardens.last.id)
  end

  def edit; end

  def destroy; end
end
