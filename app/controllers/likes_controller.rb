class LikesController < ApplicationController
  def index
    @tasks = Task.includes(:user).order("created_at DESC").page(params[:page]).per(10)
    @likes = Like.where(task_id: params[:task_id])
  end

  def create
    # -----↓メモ↓-----
    # @like = current_user.like.create(task_id: params[:task_id])
    # -----↑メモ↑-----
    @like = Like.create(user_id: current_user.id, task_id: params[:task_id])
    @likes = Like.where(task_id: params[:task_id])
    if @like.save
      flash[:good_task] = "タスクにいいねをしました。応援しましょう！"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:danger] = "送信に失敗しました。もう一度試してみてください。"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @like = Like.find_by(task_id: params[:task_id], user_id: current_user.id)
    @like.destroy
    @likes = Like.where(task_id: params[:task_id])
    flash[:cancel_good] = "いいねを取り消しました。"
    redirect_back(fallback_location: root_path)
  end

  def get_task
    @task = Task.find(params[:task_id])
  end
end