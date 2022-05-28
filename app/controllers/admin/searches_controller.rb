class Admin::SearchesController < ApplicationController
  def search_community
    @word = params[:word]
    @search_result = Community.search(params[:word])
    @communities = Community.page(params[:page]).per(20).order(created_at: :desc)
  end

  def search_area
    @communities = Community.where(area_id: params[:area_id]).page(params[:page]).per(20).order(created_at: :desc)
  end
end
