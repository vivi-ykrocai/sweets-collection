class SweetsController < ApplicationController
  def index
  end

  def new
    @sweet = Sweet.new
  end

  def create
    Sweet.create(sweet_params)
    redirect_to root_path
  end

  def show
  end

  private
  def sweet_params
    params.require(:sweet).permit(:title, :image, :visit_day, :shop_name, :shop_area, :menu, :rate, :comment).merge(user_id: current_user.id)
  end
end
