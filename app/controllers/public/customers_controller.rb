class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  # 会員の一覧を表示する
  def index
   @customer = Customer.page(params[:page]).per(10)
  end

  # 会員のmemory一覧（status別に表示）
  def memory_index
     @customer = Customer.find(params[:id])
     @memory = @customer.memories
     @memory_public = @memory.where(status: :public).page(params[:page]).per(10)
     @memory_follower_only = @memory.where(status: :follower_only).page(params[:page]).per(10)
  end

  # ログイン会員のマイページ
  def show
   @customer = Customer.find(params[:id])
   if @customer != current_customer
    redirect_to root_path
   end
   @mutual_follow = Kaminari.paginate_array(current_customer.mutual_follow).page(params[:page]).per(10)
   @follow = current_customer.follow_only.page(params[:page]).per(10)
   @follower = current_customer.follower.page(params[:page]).per(10)
  end


  def update
   @customer = Customer.find(params[:id])
   if @customer.update(customer_params)
    flash[:success] = "保存されました"
    redirect_to customer_path(current_customer)
   else
    @mutual_follow = Kaminari.paginate_array(current_customer.mutual_follow).page(params[:page]).per(6)
    @follow = current_customer.follow_only.page(params[:page]).per(6)
    @follower = current_customer.follower.page(params[:page]).per(6)
    render :show
   end
  end

  def customer_params
   params.require(:customer).permit(:name,:email,:icon)
  end

end