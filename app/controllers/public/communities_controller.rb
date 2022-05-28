class Public::CommunitiesController < ApplicationController
  before_action :authenticate_customer!, except: [:index]
  before_action :ensure_correct_customer, only: [:edit, :update]

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.owner_id = current_customer.id
    @community.customers << current_customer
    if @community.save
      flash[:notice] = "コミュニティが新しく作成されました"
      redirect_to registration_communities_path
    else
      render 'new'
    end
  end

  def index
    @communities = Community.page(params[:page]).per(20).order(created_at: :desc)
  end
  
  # コミュニティに参加する時のアクション
  def join
    @community = Community.find(params[:community_id])
    @community.customers << current_customer
    redirect_to  community_path(@community)
  end

  def show
    @community = Community.find(params[:id])
    @customers = @community.customers.page(params[:page]).per(20)
    @customer_community = CustomerCommunity.find_by(customer_id: current_customer.id, community_id: params[:id])
    @post_active = PostActive.new
    @post_actives = PostActive.where(community_id: @community.id).page(params[:page]).per(10).order(created_at: :desc)
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    if @community.update(community_params)
      flash[:notice] = "コミュニティが更新されました"
      redirect_to community_path(@community)
    else
      render 'edit'
    end
  end
  
  # コミュニテイを退会するときのアクション
  def destroy
    current_customer.customer_communities.find_by(community_id: params[:id]).destroy
    redirect_to communities_path
  end

  private

  def community_params
    params.require(:community).permit(:community_name, :area_id, :address, :phone_number, :description, :image)
  end
  
  # 権限のないページへのアクセス&編集を制限
  def ensure_correct_customer
    @community = Community.find(params[:id])
    unless @community.owner_id == current_customer.id
      redirect_to communities_path
    end
  end
end
