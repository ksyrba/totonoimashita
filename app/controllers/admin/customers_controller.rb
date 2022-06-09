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
    if @customer.is_deleted == "有効"
      @customer.update(is_deleted: true)
      redirect_to request.referer, notice: "退会処理を実行しました"
    else
      @customer.update(is_deleted: false)
      redirect_to request.referer
    end
  end

end
