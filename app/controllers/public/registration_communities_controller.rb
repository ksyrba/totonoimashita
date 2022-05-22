class Public::RegistrationCommunitiesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @communities = current_customer.communities.page(params[:page]).per(20).order(created_at: :desc)
  end
end
