class Public::CommentsController < ApplicationController
  def create
    @post_active = PostActive.find(params[:post_active_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.post_active_id = @post_active.id
    if @comment.save
      flash[:notice] = "コメントが投稿されました"
      @comments = @post_active.comments.page(params[:page]).per(10).order(created_at: :desc)
      render :comments
    else
      @customers = @post_active.community.customers.page(params[:page]).per(20)
      @comments = @post_active.comments.page(params[:page]).per(10).order(created_at: :desc)
      render :error
    end
  end
  
  def destroy
    @post_active = PostActive.find(params[:post_active_id])
    Comment.find(params[:id]).destroy
    @comments = @post_active.comments.page(params[:page]).per(10).order(created_at: :desc)
    render :comments
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
