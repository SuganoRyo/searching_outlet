class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(cafe_id: params[:cafe_id])
    redirect_back(fallback_location: caves_path, notice: "いいねしました。")
  end

  def destroy
    @like = Like.find_by(cafe_id: params[:cafe_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: caves_path, notice: "いいねを外しました。")
  end
end
