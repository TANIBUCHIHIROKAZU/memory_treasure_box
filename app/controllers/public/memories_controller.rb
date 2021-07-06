class Public::MemoriesController < ApplicationController
  def new
    @memory = Memory.new
  end
  
  def index
    @memories = current_costmer.memory.all
  end
  
  def show
    @memory = Memory.find(params[:id])
    @comment
  end
  
  def edit
    @memory = Memory.find(params[:id])
    if @memory.costomer != current_costmer
      redirect_to root
      # 後で変更する
    end
  end
  
  def create
    @memory = Memory.new(memory_params)
    @memory_costmer_id = current_costmer.id
    if @memory.save(memory_params)
      redirect_to root
      # 後で変更する
    else
      render 'new'
    end
  end
  
  def update
    @memory = Memory.find(params[:id])
   if @memory.update(memory_params)
     redirect_to root
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
   params.require(:memory).permit(:customer_id,:memory_title,:memory_detail,:is_display)
 end
  
end
