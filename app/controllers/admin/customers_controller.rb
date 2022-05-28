class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page]).per(50)
  end

  def show
    @customer = Customer.find(params[:id])
    @post_actives = @customer.post_actives.page(params[:page]).per(10).order(created_at: :desc)
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更して削除フラグを立てる 
    @customer.update(is_deleted: true)
    redirect_to admin_customer_path(@customer), notice: "退会処理を実行しました"
  end

end
