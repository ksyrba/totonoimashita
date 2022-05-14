class Public::CommunitiesController < ApplicationController
  before_action :authenticate_customer!
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
    @communities = Community.page(params[:page]).order(created_at: :desc)
  end

  def join
    @community = Community.find(params[:community_id])
    @community.customers << current_customer
    redirect_to  community_path(@community)
  end

  def show
    @community = Community.find(params[:id])
    @customers = @community.customers
    @customer_community = CustomerCommunity.find_by(customer_id: current_customer.id, community_id: params[:id])
    @post = Post.new
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    if @community.update(community_params)
      flash[:notice] = "コミュニティが更新されました"
      redirect_to registration_communities_path
    else
      render 'edit'
    end
  end

  def destroy
    @community = Community.find(params[:id])
    @community.customers.delete(current_customer)
    redirect_to communities_path
  end


  private

  def community_params
    params.require(:community).permit(:community_name, :area_id, :address, :phone_number, :description, :image)
  end

  def ensure_correct_customer
    @community = Community.find(params[:id])
    unless @community.owner_id == current_customer.id
      redirect_to communities_path
    end
  end
end
