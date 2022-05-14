class Public::PostsController < ApplicationController
  efore_action :authenticate_customer!
  before_action :ensure_correct_post, only: [:edit, :update]
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "サ活情報がが投稿されました"
      redirect_to community_path(@community)
    else
      @community = Community.find(params[:id])
      @customers = @community.customers
      @customer_community = CustomerCommunity.find_by(customer_id: current_customer.id, community_id: params[:id])
      render 'community/show'
    end
  end
  
  def show
  end

  def edit
  end
  
  private
  
  def post_params
    params.require(:post).permit(:visit_date, :set_number, :total_time, :impression)
  end

  def ensure_correct_post
    @post = Post.find(params[:id])
    @community = Community.find(params[:id])
    unless @post.customer_id == current_customer.id
      redirect_to community_path(@community)
    end
  end
end
