class Admin::OrderDetailsController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_admin!
  
  def update
  end
  
end
