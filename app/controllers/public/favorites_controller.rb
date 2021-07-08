class Public::FavoritesController < ApplicationController
  def create
   @memory = Memory.find(params[:memory_id])
   favorite = current_customer.favorites.new(memory_id: @memory.id)
   favorite.save
  end
  
  def destroy
   @memory = Memory.find(params[:memory_id])
   favorite = current_customer.favorites.find_by(memory_id: @memory.id)
   favorite.destroy
  end
end
