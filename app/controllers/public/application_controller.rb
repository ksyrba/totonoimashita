class Public::ApplicationController < ApplicationController
  
  layout 'public/application'
  before_action :authenticate_customer!, except: [:top, :about]
  
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
  
end
