class Public::CommunitiesController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update]
  
  def new
    @community = Community.new
    @community.customers << current_customer
  end
  
  def create
    @community = Community.new(community_params)
    if @community.save(community_params)
      flash[:notice] = "コミュニティが新しく作成されました"
      redirect_to registration_communities_path
    else
      render 'new'
    end  
  end

  def index
    @communities = Community.all.order(creaed_at: :desc)
  end

  def show
    @community = Community.find(parama[:id])
  end

  def edit
    @community = Community.find(params[:id])
  end
  
  def update
    @community = Community.find(params[:id])
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
    unless @community.owner_id == current_user.id
      redirect_to communities_path
    end
  end
end
