class Public::OrdersController < ApplicationController
  def plan1
    if customer_signed_in?
    @order = Order.new
    @customer = current_customer
    @plan_id = params[:id]
    
    # @plan_id = Order.plans.invert[params[:id].to_i]
    # @plan_id = Order.plans.invert[plan_id.to_i]
    else
      redirect_to root_path
    end
  end
  
  def plan2
    @order = Order.new
    if @memory.costomer != current_costmer
     redirect_to root
    end
  end
  
  def create
    @order = Order.new
    @order.plan = order_params["plan"].to_i
    @order.price = order_params["price"].to_i
    @order.payment_method = order_params["payment_method"].to_i
    @order.customer = current_customer
    if @order.save(order_params)
      redirect_to customer_path(current_customer.id)
      # 後で変更する
    else
      render 'new'
    end
  end
  
  def confirmation
    @customer = current_customer
    @order_params = order_params
  end

private
  def order_params
    params.require(:order).permit(:payment_method,:price,:plan)
  end
end
