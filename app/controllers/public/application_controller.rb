class Public::ApplicationController < ApplicationController
  
  layout 'public/application'
  before_action :authenticate_customer!, except: [:top]
  
end
