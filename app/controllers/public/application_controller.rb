class Public::ApplicationController < ApplicationController
  
  layout 'public/application'
  before_action :authenticate_customer!, except: [:top]
  
  def after_sign_in_path_for(resource)
    communities_path
  end

  def after_sign_out_path_for(resource)
    new_customer_session_path
  end
  
  def after_sign_up_path_for(resource)
    communities_path
  end
end
