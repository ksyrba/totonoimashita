class Admin::ApplicationController < ApplicationController
  
  layout 'admin/application'
  before_action :authenticate_admin!, except: [:top, :about]
  
  def after_sign_in_path_for(resource)
    admin_root_path
  end

  def after_sign_out_path_for(resource)
    new_customer_session_path
  end
  
  def after_sign_up_path_for(resource)
    customers_registration_communitys_path
  end
  
end
