class Admin::MemoriesController < ApplicationController
  def show
    @memory = Memory.find(params[:id])
    @comment = Comment.new
  end
  
  def destroy
    @memory = Memory.find(params[:id])
    @memory.destroy
    redirect_to memory_index_customer_path(current_customer)
  end
  
end
