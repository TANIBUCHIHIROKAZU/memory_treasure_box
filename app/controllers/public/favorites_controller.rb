class Public::FavoritesController < ApplicationController
  def create
   @memory = Memory.find(params[:id])
   favorite = current_costmer.favorite.new(memory_id: @memory.id)
   favorite.save
  end
  
  def destroy
   @memory = Memory.find(params[:id])
   favorite = current_costmer.favorite.find_by(memory_id: @memory.id)
   favorite.destroy
  end
end
