class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/tasks/#{comment.task.id}"
  end
  
  def destroy
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, task_id: params[:task_id])
  end
end
