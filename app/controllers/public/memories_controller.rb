class Public::MemoriesController < ApplicationController
  def new
    @memory = Memory.new
    # @memory = memory_images.build
  end

  def show
    @memory = Memory.find(params[:id])
    @memory_tags = @memory.memory_tags
    @comment = Comment.new
  end

  def edit
    @memory = Memory.find(params[:id])
    if @memory.customer != current_customer
      redirect_to root
    end
  end

  def create
    @memory = Memory.new(memory_params)
    @memory.customer = current_customer
    tag_list = params[:memory][:tag_name].split(nil)
    if @memory.save
       @memory.save_memory_tag(tag_list,current_customer)

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
    redirect_to memory_index_customer_path(current_customer)
  end

private
 def memory_params
   params.require(:memory).permit(:memory_title,:memory_detail,:status, memory_images_images: [])
 end
end
