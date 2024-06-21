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
  end
  
  def update
  end
  
private

  def item_params
  	params.require(:item).permit(:name, :genre_id, :item_detail, :is_active, :price)
  end  
  
end
