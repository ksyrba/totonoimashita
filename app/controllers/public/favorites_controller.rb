class Public::FavoritesController < ApplicationController
  
  def create
    @post_active = PostActive.find(params[:post_active_id]) 
    favorite = current_customer.favorites.new(post_active_id: @post_active.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    @post_active = PostActive.find(params[:post_active_id]) 
    favorite = current_customer.favorites.find_by(post_active_id: @post_active.id)
    favorite.destroy
    redirect_to request.referer
  end
  
end
