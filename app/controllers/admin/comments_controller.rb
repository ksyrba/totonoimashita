class Admin::CommentsController < ApplicationController
  def destroy
    @post_active = PostActive.find(params[:post_active_id])
    Comment.find(params[:id]).destroy
    @comments = @post_active.comments.page(params[:page]).per(10).order(created_at: :desc)
    render :comments
  end
end
