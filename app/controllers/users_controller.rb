class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @likes = Like.where(user_id: current_user.id)
  end
end
