class Public::ConnectionsController < ApplicationController
 def create
  current_costmer.follow(params[:id])
  redirect_back(fallback_location: root_path)
 end
 
 def destroy
  current_costmer.unfollow(params[:id])
  redirect_back(fallback_location: root_path)
 end
 
 
end
