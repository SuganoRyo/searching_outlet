class Admin::UsersController < ApplicationController
  before_action :admin_user

  def index
    @users = User.all.order("created_at DESC")
  end

  private

  def admin_user
    redirect_to caves_path, alert: '管理者ではありません。' unless current_user.admin?
  end
end
