# frozen_string_literal: true

# app/controllers/avatars_controller.rb
class AvatarsController < ApplicationController
  before_action :set_user

  # TODO: manipulate avatar instead of user
  # POST /users/:user_id/avatars
  def create
    @user.avatar.attach params[:avatar]
    redirect_to user_path(@user)
  end

  # TODO: use current_user method instead of user_id
  # DELETE /users/:user_id/avatars/:id
  def destroy
    @avatar = @user.avatar
    @avatar.purge
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find params[:user_id]
  end
end
