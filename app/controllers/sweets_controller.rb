class SweetsController < ApplicationController
  def index
    @sweets = Sweet.all.order("id DESC").page(params[:page]).per(8)
  end

  def new
    @sweet = Sweet.new
  end

  def create
    Sweet.create(sweet_params)
    redirect_to root_path
  end

  def show
    @sweet = Sweet.find(params[:id])
    @like = Like.new
    @comment = Comment.new
    @comments = @sweet.comments.includes(:user).order("id DESC")
  end

  def search
    if params[:keyword1].present?
      @search_keyword = params[:keyword1]
      @sweets_title = Sweet.where('title LIKE(?)', "%#{params[:keyword1]}%")
    elsif params[:keyword2].present?
      @search_keyword = params[:keyword2]
      @sweets_shop_name = Sweet.where('shop_name LIKE(?)', "%#{params[:keyword2]}%")
    elsif params[:keyword3].present?
      @search_keyword = params[:keyword3]
      @sweets_shop_area = Sweet.where('shop_area LIKE(?)', "%#{params[:keyword3]}%")
    end
  end

  private
  def sweet_params
    params.require(:sweet).permit(:title, :image, :visit_day, :shop_name, :shop_area, :menu, :rate, :comment).merge(user_id: current_user.id)
  end
end
