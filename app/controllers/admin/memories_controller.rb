class Admin::MemoriesController < ApplicationController
  def show
    @memory = Memory.find(params[:id])
    @comment = Comment.new
    @customer = @memory.customer
  end
  
  def destroy
    @memory = Memory.find(params[:id])
    @customer = @memory.customer
    @memory.destroy
    redirect_to memory_index_admin_customer_path(@customer)
  end
  
end
