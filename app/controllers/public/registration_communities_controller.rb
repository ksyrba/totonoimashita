class Public::RegistrationCommunitiesController < ApplicationController
  def index
    @communities = Community.page(params[:page]).where()
    @communities = current_customer.communities
  end
end
