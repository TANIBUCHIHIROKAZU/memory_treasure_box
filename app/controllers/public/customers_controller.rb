class Public::CustomersController < ApplicationController
 def index
  @customer = Customer.all
 end 
 
 def show
  @customer = Customer.find(params[:id])
  if @customer != curennt_customer
   redirect_to root
  end 
 end
 
 def update
  @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
   redirect_to root
  else
   render 'show'
  end
 end
 
 def customer_params
  params.require(:customer).permit(:name,:email,:icon)
 end
 
end