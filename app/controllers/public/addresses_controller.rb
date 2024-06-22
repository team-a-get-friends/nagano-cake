class Public::AddressesController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_customer!

  def index
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
