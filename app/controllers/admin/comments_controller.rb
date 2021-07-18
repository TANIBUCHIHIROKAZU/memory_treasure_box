class Admin::CommentsController < ApplicationController
  # コメント削除機能
  def destroy
    @memory = Memory.find(params[:memory_id])
    comment = @memory.comments.find_by(params[:id])
    comment.memory_id = @memory.id
    comment.destroy
    @comment = Comment.new
  end
  
end
