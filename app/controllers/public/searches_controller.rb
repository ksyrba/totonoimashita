class Public::SearchesController < ApplicationController
  
  def search_community
    @community = Community.search(params[:word])
    @word = params[:word]
    render 'public/communities/index'
  end
  
end
