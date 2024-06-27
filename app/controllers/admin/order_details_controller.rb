class Admin::OrderDetailsController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    # すべての製作ステータスの確認のために@order_detailsも定義
    # アソシエーションがあるから、where使わないで定義できないのかな？？
    @order_details = OrderDetail.where(order_id: @order_detail.order_id)
    # 取り出される形を確認（ターミナル）、アクション自体には不要
    puts @order_detail.making_status
    # 関連するorderを呼び出す
    @order = @order_detail.order
    # 取り出される形を確認（ターミナル）、アクション自体には不要
    puts @order.status
    # if文によって整数＝＞文字になってしまう、条件を文字にすれば検出できる！
    if @order_detail.making_status == "in_making" && @order.status == "confirming_payment"
      @order.update(status: 2)
    elsif @order_detail.making_status == "completed" && @order_details.all? {|order_detail| order_detail.making_status == "completed"}
      @order.update(status: 3)
    end
    redirect_to admin_order_path(@order_detail.order_id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

  # ステータスの連動のために定義
  def order_params
    params.require(:order).permit(:status)
  end

end
