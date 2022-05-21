class Public::SearchesController < ApplicationController

  def search_community
    # binding.pry
    @search_result = Community.search(params[:word])
    @communities = Community.page(params[:page]).per(20).order(created_at: :desc)
  end

  def search_area
    # binding.pry
    # @community = Community.find_by(area_id: params[:area_id])
    @communities = Community.where(area_id: params[:area_id]).page(params[:page]).per(20).order(created_at: :desc)
  end
end
