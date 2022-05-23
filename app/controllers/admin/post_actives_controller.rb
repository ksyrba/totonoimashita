class Admin::PostActivesController < ApplicationController
  before_action :authenticate_admin!
  protect_from_forgery

  def show
    @post_active = PostActive.find(params[:id])
    @customers = @post_active.community.customers.page(params[:page]).per(20)
    @comments = @post_active.comments.page(params[:page]).per(10).order(created_at: :desc)
  end

  def destroy
    @post_active = PostActive.find(params[:id])
    @post_active.destroy
    redirect_to admin_community_path(@post_active.community_id)
  end
  
end
