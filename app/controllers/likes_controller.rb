class LikesController < ApplicationController
  def create
    @like = Like.create(sweet_id: params[:sweet_id], user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(sweet_id: params[:sweet_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
