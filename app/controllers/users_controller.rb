class UsersController < ApplicationController
  before_action :already_login?, only: [:new, :create]
  before_action :login?, only: [:show, :destroy, :edit, :update]
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to caves_path, notice: "新規登録しました。"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path, notice: "編集しました。"
    else
      flash.now[:alert] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
