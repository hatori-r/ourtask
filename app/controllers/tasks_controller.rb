class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @tasks = Task.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end
  
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    if task.save
      flash[:new_task] = "タスクをシェアしました。達成に向けて頑張りましょう！"
      redirect_to '/'
    else
      flash.now[:danger] = "送信に失敗しました。もう一度試してみてください。"
      render 'tasks/new'
    end
  end

  def edit
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    if task.save
      flash[:update_task] = "タスクを更新しました。"
      redirect_to "/tasks/#{task.id}"
    else
      flash.now[:danger] = "送信に失敗しました。もう一度試してみてください。"
      render 'tasks/new'
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    flash[:delete_task] = "タスクを削除しました。"
    redirect_to '/'
  end

  def show
    @comment = Comment.new
    @comments = @task.comments.includes(:user)
    @like = Like.new
  end

  private
  def task_params
    params.require(:task).permit(:state, :task, :limit_date).merge(user_id: current_user.id)
  end

  def set_task
    @task = Task.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
