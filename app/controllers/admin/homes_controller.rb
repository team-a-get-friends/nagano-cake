class Admin::HomesController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_admin!

  def top
    @orders = Order.page(params[:page]).per(10)
  end

end
