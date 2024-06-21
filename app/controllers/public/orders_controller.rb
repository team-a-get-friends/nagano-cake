class Public::OrdersController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_customer!

  def new
    @order = Order.new

  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end

end
