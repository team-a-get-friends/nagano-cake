class Admin::ItemsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  #商品詳細情報
  def show
    # Itemsのsを削除(Name Error発生)
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

end
