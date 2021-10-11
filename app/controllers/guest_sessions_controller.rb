class GuestSessionsController < ApplicationController
  def create
    user = User.find_or_create_by(email: "guest@gmail.com") do |users|
      user.password = guestdesu
    end
    session[:user_id] = user.id
    redirect_to caves_path, notice: "ゲストユーザーとしてログインしました"
  end
end
