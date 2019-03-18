# frozen_string_literal: true

class CommentsController < ApplicationController
  def index; end

  def create
    Comment.create(garden_id: params[:garden_id], content: params[:content], user: current_user)
    redirect_to gardens_path(params[:garden_id])
  end

  def show
    @comments = Comment.where(garden_id: params[:id])
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to gardens_path
  end
end
