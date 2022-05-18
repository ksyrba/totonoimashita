class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @post_actives = @customer.post_actives
    @this_month_post = @customer.post_actives.created_this_month
    @this_year_post = @customer.post_actives.created_this_year
  end

  def edit
    @customer = Customer.find(params[:id])
    @this_month_post = @customer.post_actives.created_this_month
    @this_year_post = @customer.post_actives.created_this_year
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "ユーザー情報が更新されました"
      redirect_to customer_path(current_customer)
    else
      @post_actives = @customer.post_actives
      @this_month_post = @customer.post_actives.created_this_month
      @this_year_post = @customer.post_actives.created_this_year
      render 'show'
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :sex, :birthdate, :area_id, :introduction, :is_deleted, :image)
  end
end
