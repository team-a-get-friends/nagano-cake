class Public::CustomersController < ApplicationController

  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_customer!

  def show
  end

  def edit
  end

  def update
  end

  def unsubscribe
    #モデル名.find_by(カラム名: 検索する値)
    @customer = Customer.find_by(name: params[:name])
  end

  def withdraw
    @customer = Customer.find_by(name: params[:name])
    @customer.update(is_active: false)
    reset_session
    #新規会員登録画面に遷移
    redirect_to (new_customer_registration)

    #redirect_to (/customer/sign_up)
  end

end
