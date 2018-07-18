class CommentsController < ApplicationController
  def new
  end
  
  def create
    @comment = Comment.new(comment_params)
    debugger
    @comment.post_id = @comment.post_id
    @comment.save
    flash[:errors] = @comment.errors.full_messages
    redirect_to post_url(@comment.post_id)
  end
  
private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
