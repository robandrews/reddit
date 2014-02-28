class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.link_id = params[:link_id]
    @comment.save
    redirect_to link_url(@comment.link_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :parent_comment_id)
  end
end
