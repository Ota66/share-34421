class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit]

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def show
    @tweets = @user.tweets.order("created_at DESC")
    @likes = Like.all
  end

  private
  def user_params
    params.require(:user).permit(:introduction, :nickname, :avatar, :header_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
