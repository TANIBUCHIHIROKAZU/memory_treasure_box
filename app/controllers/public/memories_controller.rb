class Public::MemoriesController < ApplicationController
  def new
    @memory = Memory.new
  end
  
  def show
    @memory = Memory.find(params[:id])
    @comment = Comment.
  end
  
  def edit
    @memory = Memory.find(params[:id])
    if @memory.customer != current_customer
      redirect_to root
      # 後で変更する
    end
  end
  
  def create
    @memory = Memory.new(memory_params)
    @memory.customer_id = current_customer.id
    if @memory.save(memory_params)
      redirect_to memory_path(@memory)
    else
      render 'new'
    end
  end
  
  def update
    @memory = Memory.find(params[:id])
   if @memory.update(memory_params)
     redirect_to memory_path(@memory)
   else
     render 'edit'
   end
  end
  
  def destroy
    @memory = Memory.find(params[:id])
    @memory.destroy
    redirect_to root
  end
  
private
 def memory_params
   params.require(:memory).permit(:customer_id,:memory_title,:memory_detail,:status)
 end
  
end
