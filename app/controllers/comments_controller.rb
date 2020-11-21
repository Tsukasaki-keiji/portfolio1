class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save!
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end  
  end
  
  def destroy
    comment = current_user.comment.find(params[:id])
    comment.destroy
    redirect_to blog_path(params[:blog_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment_content, :blog_id)
  end  
end
