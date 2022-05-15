class Public::CommentsController < ApplicationController
  def create
    @post_active = PostActive.find(params[:post_active_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.post_active_id = post_active.id
    @comment.save
    redirect_to post_active_path(post_active)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
