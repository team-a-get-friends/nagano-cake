class Admin::OrdersController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = @order
  end

  def update
  end

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end

end
