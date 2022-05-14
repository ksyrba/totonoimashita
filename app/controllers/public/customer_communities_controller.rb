class Public::CustomerCommunitiesController < ApplicationController
  def create
    @customer_community = CustomerCommunity.new(customer_id: current_customer.id, community_id: params[:community_id])
    if @customer_community.save
      # コミュニティ参加後のリダイレクト先を指定
      redirect_to community_path(@customer_community.community_id)
    end
  end
end
