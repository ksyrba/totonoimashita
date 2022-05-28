class Admin::ApplicationController < ApplicationController

  layout 'admin/application'
  before_action :authenticate_admin!, except: [:top]

end
