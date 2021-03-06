class Admin::MemoriesController < ApplicationController
  before_action :authenticate_admin!

  def show
    @memory = Memory.find(params[:id])
    @memory_tags = @memory.memory_tags
    @comment = Comment.new
    @customer = @memory.customer
  rescue ActiveRecord::RecordNotFound => e # データーを削除し、戻ってもエラーが出ない処理
    redirect_to admin_customers_path
  end

  def tag_index
    @customer = Customer.find(params[:customer_id])
    @tag = @customer.memory_tags.find(params[:memory_tag_id])
    @memory = @tag.memories.all
    @memory_public = @memory.where(status: :public).page(params[:page]).per(9) # 全て公開
    @memory_follower_only = @memory.where(status: :follower_only).page(params[:page]).per(9) # 限定公開
  end

  def destroy
    @memory = Memory.find(params[:id])
    @customer = @memory.customer
    @memory.destroy
    redirect_to admin_customers_path
  end
end
