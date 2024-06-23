class Public::OrdersController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
	  @total_item_price = params[:cart_item][:total_item_price]
	  #請求金額を商品合計と送料の和で算出
	  #送料はconfig/settings/development.ymlで定義したものを呼び出す
    @order = Order.new(order_params)
	  @order.total_price = @total_item_price.to_i + Setting.order.shipping_fee
      case params[:order][:select_address]
	      when 0
		      @order.post_code = current_customer.post_code
		      @order.address = current_customer.address
		      @order.name = current_customer.first_name + current_customer.last_name
	      when 1
		      @address = Address.find(params[:order][:address_id])
		      @order.post_code = @address.post_code
		      @order.address = @address.address
		      @order.name = @address.name
	      when 2
		      @order.post_code = params[:order][:post_code]
		      @order.address = params[:order][:address]
		      @order.name = params[:order][:name]
      end
	  @order.save
	  redirect_to thanks_orders_path
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:post_code,:address,:name,:total_price,:status)
  end

end
