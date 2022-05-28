class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :admin_check
  protect_from_forgery

  protected
  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :birthdate, :area_id])
  end
  
  # ログイン前の画面が管理者か会員か確認するため
  def admin_check
    @current_path = request.path
  end

end
