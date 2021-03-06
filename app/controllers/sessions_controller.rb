class SessionsController < ApplicationController
  before_action :already_login?, except: :destroy
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password]) && user.admin == true
      session[:user_id] = user.id
      redirect_to admin_users_path, notice: "管理者としてログインしました。"
    elsif user && user.authenticate(params[:password]) && user.admin == false
      session[:user_id] = user.id
      redirect_to caves_path, notice: "ログインしました。"
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが間違っています。"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました。"
  end
end
