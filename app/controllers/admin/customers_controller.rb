class Admin::CustomersController < ApplicationController
  
  def index
    @customer = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render :show
    end
  end
  
private
  def customer_params
    params.require(:customer).permit(:name, :email, :is_active, :customer_number, :plan)
  end
  
end
