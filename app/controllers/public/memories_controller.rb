class Public::MemoriesController < ApplicationController
  def new
    @memory = Memory.new
  end

  def show
    @memory = Memory.find(params[:id])
    @memory_tags = @memory.memory_tags
    @comment = Comment.new
  end

  def edit
    @memory = Memory.find(params[:id])
    if @memory.customer != current_customer
      redirect_to root_path
    end
  end

  def create
    if params[:memory].blank?
      redirect_to new_memory_path
      return
    end
    @memory = Memory.new(memory_params)
    @memory.customer = current_customer
    tag_list = params[:memory][:tag_name]&.split(nil)
    if @memory.save
      if current_customer.plan == "plan_2"
        @memory.save_memory_tag(tag_list,current_customer)
      else
        flash[:danger] = "あなたのプランではタグ機能は使用できません"
      end
      redirect_to memory_path(@memory)
    else
      render 'new'
    end
  end

  def update
    @memory = Memory.find(params[:id])
    tag_list = params[:memory][:tag_name]&.split(nil)
   if @memory.update(memory_params)
     @memory.save_memory_tag(tag_list,current_customer)
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
