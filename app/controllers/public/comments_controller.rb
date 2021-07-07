class Public::CommentsController < ApplicationController
 def create
  @memory = Memory.find(params[:id])
  comment = current_costmer.comment.new(comment_params)
  comment.memory_id = @memory.id
  comment.save
  @comment = Comment.new
 end
 
 def destroy
  @memory = Memory.find(params[:id])
  comment = current_costmer.comment.find_by(params[:id])
  comment.destroy
  @comment = Comment.new
 end
 
private
 def comment_params
  params.require(:comment).permit(:customer_id,:memory_id,:comment)
 end

end
