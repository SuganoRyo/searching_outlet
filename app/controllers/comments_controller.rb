class CommentsController < ApplicationController
  def create
    @cafe = Cafe.find(params[:cafe_id])
    @comment = @cafe.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: caves_path, notice: "コメントしました。")
    else
      redirect_back(fallback_location: caves_path, notice: "コメントに失敗しました。")
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
