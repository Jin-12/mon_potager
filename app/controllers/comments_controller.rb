# frozen_string_literal: true

# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  # DEV_PLAN: choose between polymorphic comments or garden/comments

  # POST /gardens/:garden_id/comments
  def create
    @comment = Comment.create garden_id: params[:id], content: params[:content], user: current_user
    redirect_to garden_path @comment.garden
  end

  # GET /gardens/:garden_id/comments/:id
  # TODO: change def to index
  def show
    @comments = Comment.where garden_id: params[:id]
  end

  # DELETE /gardens/:garden_id/comments/:id
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to gardens_path
  end
end
