class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update]
  
  def show
    @customer = Customer.find(params[:id])
    @post_actives = @customer.post_actives
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "ユーザー情報が更新されました"
      redirect_to customer_path(current_customer)
    else
      @post_actives = @customer.post_actives
      render 'show'
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :sex, :birthdate, :area_id, :introduction, :is_deleted, :image)
  end
  
  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end
end
