class Public::CommunitiesController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update]
  
  def new
    @community = Community.new
  end
  
  def create
    @community = Community.new(community_params)
    @community.owner_id = current_customer.id
    if @community.save(community_params)
      flash[:notice] = "コミュニティが新しく作成されました"
      redirect_to registration_communities_path
    else
      render 'new'
    end  
  end

  def index
    @communities = Community.all.order(created_at: :desc)
  end

  def show
    @community = Community.find(parama[:id])
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
  end
  
  
  private 
  
  def community_params
    params.require(:community).permit(:community_name, :area, :adress, :description)
  end
  
  def ensure_correct_user
    @community = Community.find(params[:id])
    unless @community.owner_id == current_customer.id
      redirect_to communities_path
    end
  end
end
