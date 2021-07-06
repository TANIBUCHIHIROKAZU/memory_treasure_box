class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    if @memory.costomer != current_costmer
     redirect_to root
    end
  end
  
  def create
    @order = Order.new(order_params)
    @order_costmer_id = current_costmer.id
    if @order.save(order_params)
      redirect_to root
      # 後で変更する
    else
      render 'new'
    end
  end
  
  def confirmation
    @order = Order.find(params[:id])
  end

private
  def order_params
    params.require(:order).permit(:customer_id,:payment_method,:price,:plan)
  end
end
