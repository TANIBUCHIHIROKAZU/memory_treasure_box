class Admin::MemoriesController < ApplicationController
  
  def show
    begin
      @memory = Memory.find(params[:id])
      @memory_tags = @memory.memory_tags
      @comment = Comment.new
      @customer = @memory.customer
    rescue ActiveRecord::RecordNotFound => e
      redirect_to admin_customers_path
    end
  end
  
  def destroy
    @memory = Memory.find(params[:id])
    @customer = @memory.customer
    @memory.destroy
    redirect_to admin_customers_path
  end
  
end
