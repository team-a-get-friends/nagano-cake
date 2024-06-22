class Public::CartItemsController < ApplicationController
  
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_item = CartItem.find(params[:item_id])
  end

  def destroy
  end

  def destroy_all
    
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.item_id = params[:item_id]
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
	    cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
	    cart_item.amount += params[:cart_item][:amount].to_i
	    cart_item.update(amount: cart_item.amount)
	    redirect_to cart_items_path
    else
	    cart_item.save
	    redirect_to cart_items_path
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
