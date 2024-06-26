class Admin::OrdersController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = @order
    @total_item_price = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
