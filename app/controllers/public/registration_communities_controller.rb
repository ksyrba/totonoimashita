class Public::RegistrationCommunitiesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @communities = current_customer.communities
  end
end
