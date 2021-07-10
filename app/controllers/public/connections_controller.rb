class Public::ConnectionsController < ApplicationController
 def create
  current_customer.follow(params[:id])
  redirect_back(fallback_location: root_path)
 end
 
 def destroy
  current_customer.unfollow(params[:id])
  redirect_back(fallback_location: root_path)
 end
 
 
end
