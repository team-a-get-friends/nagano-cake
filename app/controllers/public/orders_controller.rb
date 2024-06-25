class Public::OrdersController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @cart_items = CartItem.all
    # カートアイテムを保存するときにcustomer_idは保存している
    # @cart_items.customer_id = current_customer.id

	  @total_item_price = params[:order][:total_item_price]

    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
	  #請求金額を商品合計と送料の和で算出
	  #送料はOrderモデルで定義したものを呼び出す
	  @order.total_price = @total_item_price.to_i + @order.shipping_fee.to_i
	   # paramsで受け取ると文字列に変換される
      case params[:order][:select_address]
	      when "0"
	        p 00000
		      @order.post_code = current_customer.post_code
		      @order.address = current_customer.address
		      @order.name = current_customer.first_name + current_customer.last_name
	      when "1"
	        p 11111
		      @address = Address.find(params[:order][:address_id])
		      @order.post_code = @address.post_code
		      @order.address = @address.address
		      @order.name = @address.name
	      when "2"
	        p 22222
		      @order.post_code = params[:order][:post_code]
		      @order.address = params[:order][:address]
		      @order.name = params[:order][:name]
      end
    @order.shipping_fee = SHIPPING_FEE
    # まだ確定していないのでsaveはしない
    # @order.save
	 # ビューを持たない場合のみredirect_toが必要
	 # redirect_to confirm_orders_path
  end

  # カート内商品を注文詳細に移す作業をする
  def create
    # idはデータが保存できた時点で付与される
    # @order = Order.find(params[:id])

    # form_withのデータを受け取る
    @order = Order.new(order_params)
    @order.status = 0
    @order.save
    # カレントカスタマーに紐づくカートアイテムを持ってこれる
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      order_detail.save
    end

    # eachで実施
    # @order_detail.order_id = @order.id
    # @cart_item.customer_id = current_customer.id
    # @order_detail.item_id = @cart_item.item_id
    # @order_detail.price = Item.find(@cart_item.item_id).price
    # @order_detail.amount = @cart_item.amount
    # @order_detail.save

    @cart_items.destroy_all
    redirect_to thanks_orders_path
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    # ここでも使える？？
    @total_item_price = params[:order][:total_item_price]
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:payment_method,:post_code,:address,:name,:total_price,:status,:shipping_fee)
  end

end
