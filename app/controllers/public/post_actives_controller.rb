class Public::PostActivesController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_post_active, only: [:edit, :update]

  def create
    @post_active = PostActive.new(post_params)
    @post_active.customer_id = current_customer.id
    if @post_active.save
      flash[:notice] = "サ活情報がが投稿されました"
      redirect_to community_path(@post_active.community_id)
    else
      @community = Community.find(params[:post_active][:community_id])
      @customers = @community.customers
      @customer_community = CustomerCommunity.find_by(customer_id: current_customer.id, community_id: @community.id)
      @post_actives = PostActive.where(community_id: @community.id).page(params[:page]).order(created_at: :desc)
      render 'public/communities/show'
    end
  end

  def show
    @post_active = PostActive.find(params[:id])
    @community = @post_active.community
    @customers = @post_active.community.customers
    @comment = Comment.new
  end

  def edit
  end

  private

  def post_params
    params.require(:post_active).permit(:visit_date, :set_number, :total_time, :impression, :community_id)
  end

  def ensure_correct_post_active
    @post_active = PostActive.find(params[:id])
    @community = Community.find(params[:id])
    unless @post_active.customer_id == current_customer.id
      redirect_to community_path(@community)
    end
  end
end
