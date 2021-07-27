class Public::InformationsController < ApplicationController
  
  def index
    @information = Information.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @information = Information.find(params[:id])
  end

end
