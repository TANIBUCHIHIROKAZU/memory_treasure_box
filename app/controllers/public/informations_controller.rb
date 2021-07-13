class Public::InformationsController < ApplicationController
  def index
    @information = Information.all
  end

  def show
    @information = Information.find(params[:id])
  end


end
