class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id).order("id DESC")
  end
end
