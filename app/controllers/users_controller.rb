class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.update if params[:image_delete].present?
    if @user.update(user_params)
     flash[:notice] = "ユーザー情報を更新しました"
     redirect_to profile_users_path
    else
     render profile_users_path
    end
  end

  def profile
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile, :image, :encrypted_password)
  end
end
