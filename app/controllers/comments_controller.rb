# frozen_string_literal: true

class CommentsController < ApplicationController
  def index; end

  def create
    Comment.create(garden_id: params[:id], content: params[:content], user_id: current_user.id)
    redirect_to garden_path(Comment.last.garden.id)
  end

  def show
    @comments = Comment.where(garden_id: params[:id])
  end

  def destroy
    puts 'Ooo_________________ca ne fonctionne passsss ___________________________________-ooO'
    Comment.find(params[:id]).destroy
    puts '____________________________________________________________'
    redirect_to gardens_path
  end
end
