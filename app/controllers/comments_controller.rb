class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @project = Project.find(params[:project_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to project_path(@project)
    else
      redirect_to root_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, project_id: params[:project_id])
  end
end
