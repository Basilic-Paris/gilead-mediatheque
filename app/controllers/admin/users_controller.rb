class Admin::UsersController < ApplicationController

  def index
    @users = policy_scope([:admin, User])
    @user = User.new
  end

  def create
    @users = policy_scope([:admin, User])
    @user = User.new(user_params)
    authorize([:admin, @user])
    if @user.save
      @user.need_change_password! # thanks to gem devise-security
      redirect_to admin_users_path
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
