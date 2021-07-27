class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customer = Customer.page(params[:page]).per(9)
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def search
    @customers = Customer.search(params[:search]).page(params[:page]).per(9)
  end
  
  def memory_index
    @customer = Customer.find(params[:id])
    @memory = @customer.memories
    @memory_public = @memory.where(status: :public).page(params[:page]).per(9)
    @memory_follower_only = @memory.where(status: :follower_only).page(params[:page]).per(9)
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
      flash[:success] = "保存されました"
    else
      render :show
    end
  end
  
private
  def customer_params
    params.require(:customer).permit(:name, :email, :is_active, :customer_number, :plan)
  end
  
end
