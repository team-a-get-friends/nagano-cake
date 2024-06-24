class Admin::ItemsController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_admin!
  # idを元にitemを一件取得するという処理が重複するため
  before_action :set_item, only: %i[show edit update]

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def show
    @admin = admin.find(params[:id])
    @itemss = @admin.items.page(params[:page])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to item_path(@item)
  end

  def update

    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:genre_id, :name, :item_detail, :is_active, :price, :item_image)
  end
end
