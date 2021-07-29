class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!

  # コメント作成
  def create
    @memory = Memory.find(params[:memory_id])
    comment = current_customer.comments.new(comment_params)
    comment.memory_id = @memory.id
    comment.save
    @comment = Comment.new
  end

  # コメント
  def destroy
    @memory = Memory.find(params[:memory_id])
    comment = current_customer.comments.find(params[:id])
    comment.destroy
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:customer_id, :memory_id, :comment)
  end
end
