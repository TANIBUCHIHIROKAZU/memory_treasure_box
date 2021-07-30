class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = Customer.page(params[:page]).per(9)
  end

  # 会員のmemory一覧
  def memory_index
    @customer = Customer.find(params[:id])
    @memory = @customer.memories
    @memory_public = @memory.where(status: :public).page(params[:page]).per(9) # 全て公開
    @memory_follower_only = @memory.where(status: :follower_only).page(params[:page]).per(9) # 限定公開
  end

  def show
    @customer = Customer.find(params[:id])
    if @customer != current_customer
      redirect_to root_path
    end
    @mutual_follow = Kaminari.paginate_array(current_customer.mutual_follow).page(params[:page]).per(9) # 相互フォロー一覧
    @follow = current_customer.follow_only.page(params[:page]).per(9) # フォロー一覧
    @follower = current_customer.follower.page(params[:page]).per(9) # フォロワー一覧
  end

  def search
    @customers = Customer.search(params[:search]).page(params[:page]).per(9)
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "保存されました"
      redirect_to customer_path(current_customer)
    else
      @mutual_follow = Kaminari.paginate_array(current_customer.mutual_follow).page(params[:page]).per(6) # 相互フォロー一覧
      @follow = current_customer.follow_only.page(params[:page]).per(6) # フォロー一覧
      @follower = current_customer.follower.page(params[:page]).per(6) # フォロワー一覧
      render :show
    end
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :icon)
  end
end
