class Public::CommentsController < ApplicationController
  def create
    @post_active = PostActive.find(params[:post_active_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.post_active_id = @post_active.id
    if @comment.save
      redirect_to post_active_path(@post_active)
    else
      @community = @post_active.community
      @customers = @post_active.community.customers
      @comments = @post_active.comments
      render 'public/post_actives/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
