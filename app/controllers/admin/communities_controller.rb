class Admin::CommunitiesController < ApplicationController
  before_action :authenticate_admin!, except: [:index]

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.owner_id = current_admin.id
    if @community.save
      flash[:notice] = "コミュニティが新しく作成されました"
      redirect_to admin_communities_path
    else
      render 'new'
    end
  end

  def index
    @communities = Community.page(params[:page]).per(50).order(created_at: :desc)
  end

  def show
    @community = Community.find(params[:id])
    @customers = @community.customers.page(params[:page]).per(20)
    @post_actives = PostActive.where(community_id: @community.id).page(params[:page]).per(10).order(created_at: :desc)
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    @community = Community.find(params[:id])
    if @community.update(community_params)
      flash[:notice] = "コミュニティが更新されました"
      redirect_to admin_community_path(@community)
    else
      render 'edit'
    end
  end
  
  # コミュニティを削除するためのアクション
  def destroy
    @community = Community.find(params[:id])
    if @community.destroy
      flash[:notice] = "コミュニティが削除されました"
      redirect_to admin_communities_path
    end
  end

  private

  def community_params
    params.require(:community).permit(:community_name, :area_id, :address, :phone_number, :description, :image)
  end

end
