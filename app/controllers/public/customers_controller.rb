class Public::CustomersController < ApplicationController
 before_action :authenticate_customer!
 def index
  @customer = Customer.all
 end 
 
 def memory_index
    
    @customer = Customer.find(params[:id])
    @memory = @customer.memories
    @memory_public = @memory.where(status: :public)
    @memory_follower_only = @memory.where(status: :follower_only)
    # @memories = current_customer.memory.all
 end
 
 def show
  @customer = Customer.find(params[:id])
  if @customer != current_customer
   redirect_to root_path
  end
  @mutual_follow = current_customer.mutual_follow
  @follow = current_customer.follow_only
  @follower = current_customer.follower
 end
 
 def update
  @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
   redirect_to customer_path
  else
   render 'show'
  end
 end
 
 def customer_params
  params.require(:customer).permit(:name,:email,:icon)
 end
 
end