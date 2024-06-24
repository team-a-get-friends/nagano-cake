class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    # カートに送る商品のidは表示されているページの商品のid
    @cart_item.item_id = @item.id
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :item_detail, :is_active, :price, :item_image)
  end

end
