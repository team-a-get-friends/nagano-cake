class Admin::ItemsController < ApplicationController
  
  def index
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to item_path(@item) #要確認・・・！
  end
  
  def show
  end
  
  def edit
    @item = Item.find(params[:id])
    redirect_to item_path(@item)
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item)
  end
  
private

  def item_params
  	params.require(:item).permit(:name, :genre_id, :item_detail, :is_active, :price)
  end  
  
end
