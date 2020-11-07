class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :following, :followers]
  before_action :check_guest, only: [:update, :destroy]

  def index
  end

  def new
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end
  
  def update
    if current_user.update(user_params) && @user.save
      flash[:new_task] = "プロフィールを更新しました。"
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = "プロフィールの更新に失敗しました。"
      redirect_to edit_user_path(current_user)
    end
  end
  
  def show
    @image = @user.image
    @tasks = @user.tasks.order("created_at DESC").page(params[:page]).per(10)
    @likes = Like.where(user_id: @user.id).order("created_at DESC").page(params[:page]).per(10)
  end
  
  def destroy
  end

  def following
  end

  def followers
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def check_guest
    if params[:user][:email].downcase == 'guest@example.com'
      redirect_to user_path(current_user), method: :get
      flash[:guest_alert] = 'ゲストユーザーの変更・削除はできません。'
    end
  end

  def user_params
    params.fetch(:user, {}).permit(:nickname)
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :profile, :site, :twitter, :facebook, :instagram, :image)
  end
end
