class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  # 申し込み画面に遷移
  def plan_order
    if customer_signed_in?
      @order = Order.new
      @order.plan = Order.plans.invert[params[:plan_id].to_i]
      @order.price = Order.prices.invert[params[:price_id].to_i]
      @customer = current_customer
    else
      redirect_to root_path
      flash[:notice] = "購入するにはアカウントが必要です"
      return
    end

    if current_customer.plan_before_type_cast.to_s == params[:plan_id] || plan_verification
      redirect_to root_path
      flash[:notice] = "このアカウントのプランで購入できません"
      return
    end
  end

  # 最終確認画面
  # 購入完了後、confirmationに戻るとトップに戻る
  def confirmation
    if params[:order].blank?
      redirect_to root_path
      return
    end
    @customer = current_customer
    @order = Order.new(order_params)
  end

  # orderに保存後、customerのplanにも保存をする
  def create
    @order = Order.new
    @order.plan = order_params["plan"]
    @order.price = order_params["price"]
    @order.payment_method = order_params["payment_method"]
    @order.customer = current_customer
    if @order.save
      current_customer.update_attributes(plan: @order.plan)
      redirect_to customer_path(current_customer.id)
    else
      flash[:danger] = "購入に失敗しました"
      render root_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :price, :plan)
  end

  def plan_verification
    # freeの人
    if current_customer.plan_before_type_cast.to_s == '0'
      false
    # 1の人
    elsif current_customer.plan_before_type_cast.to_s == '1'
      false
    # 2の人
    elsif current_customer.plan_before_type_cast.to_s == '2'
      params[:plan_id].to_s == '1'
    end
  end
end
