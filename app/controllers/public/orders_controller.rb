class Public::OrdersController < ApplicationController
  # 申し込み画面に遷移
  def plan_order
    if current_customer.plan_before_type_cast.to_s == params[:id] || (current_customer.plan_before_type_cast.to_s && (params[:id] == 1.to_s))
      redirect_to root_path
      flash[:notice] = "このアカウントのプランで購入できません"
      return
    end
    
    if customer_signed_in?
      @order = Order.new
      @customer = current_customer
      @plan_id = params[:id]
    else
      redirect_to root_path
      flash[:notice] = "購入するにはアカウントが必要です"
    end
  end
  # 最終確認画面
  # 購入完了後、確認画面に戻る場合トップに戻る
  def confirmation
    if params[:order].blank?
     redirect_to root_path
     return
    end
    @customer = current_customer
    @order_params = order_params
  end
  
  # orderに保存後、customerのplanにも保存をする
  def create
    @order = Order.new
    @order.plan = order_params["plan"].to_i
    @order.price = order_params["price"].to_i
    @order.payment_method = order_params["payment_method"].to_i
    @order.customer = current_customer
    if @order.save
      current_customer.update_attributes(plan: @order.plan )
      redirect_to customer_path(current_customer.id)
    else
      render 'new'
    end
  end

private
  def order_params
    params.require(:order).permit(:payment_method,:price,:plan)
  end
end
