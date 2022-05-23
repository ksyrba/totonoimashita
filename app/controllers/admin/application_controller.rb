class Admin::ApplicationController < ApplicationController
  
  layout 'admin/application'
  before_action :authenticate_admin!, except: [:top]
  
  def after_sign_in_path_for(resource)
    admin_communities_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
  
  def after_sign_up_path_for(resource)
    admin_communities_path
  end
  
end
