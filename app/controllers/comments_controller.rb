class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to sweet_path(@comment.sweet.id) }
        format.json
      end
    else
      flash.now[:alert] = 'コメントを入力してください。'
      redirect_to sweet_path(@comment.sweet.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(sweet_id: params[:sweet_id], user_id: current_user.id)
  end
end
