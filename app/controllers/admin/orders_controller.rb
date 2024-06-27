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
    # 関連するorder_detailを呼び出して連動させられる
    @order_details = @order.order_details
    # 入金待ち0＝＞入金確認1
    if @order.status == "confirming_payment"
      @order_details.each do |order_detail|
        order_detail.update(making_status: 1)
      end
    end
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

  # ステータスの連動のために定義
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
