class Public::ItemsController < ApplicationController
  
  def index
  end
  
  def show
    @item = Item.find(params[:id])
    # カートに送る商品のidは表示されているページの商品のid
    @cart_item.item_id = @item.id
  end
  
  
end
