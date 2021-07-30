class Admin::InformationsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @information = Information.new
  end

  def index
    @information = Information.page(params[:page]).per(10).reverse_order
  end

  def show
    @information = Information.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e # データーを削除し、戻ってもエラーが出ない処理
    redirect_to admin_informations_path
  end

  def edit
    @information = Information.find(params[:id])
  end

  def create
    @information = Information.new(information_params)
    @information.admin_id = current_admin.id
    if @information.save(information_params)
      redirect_to admin_information_path(@information)
      flash[:success] = "保存されました"
    else
      render 'new'
    end
  end

  def update
    @information = Information.find(params[:id])
    if @information.update(information_params)
      redirect_to admin_information_path(@information)
      flash[:success] = "保存されました"
    else
      render 'edit'
    end
  end

  def destroy
    @information = Information.find(params[:id])
    @information.destroy
    redirect_to admin_informations_path
  end

  private

  def information_params
    params.require(:information).permit(:admin_id, :admin_genre_id, :information_title, :information_detail)
  end
end
