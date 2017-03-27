class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    @post = Post.find(params[:post_id])
    if @comment.save
      redirect_to post_url(@post)
    else
      flash_errors(@comment)
      redirect_to post_url(@post)
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
