class Admin::CustomersController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_admin!

  def index
    #管理者の顧客一覧記述
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
  end

end
