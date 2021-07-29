class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  # コメント削除機能
  def destroy
    @memory = Memory.find(params[:memory_id])
    comment = @memory.comments.find(params[:id])
    comment.destroy
    @comment = Comment.new
  end
end
