class Admin::ItemsController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_admin!
  
  def index
  end
  
  def new
    @item = Item.new
  end
  
  def create
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
end
