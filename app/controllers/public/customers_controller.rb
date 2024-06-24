class Public::CustomersController < ApplicationController

  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_customer!

  def show
  end

  def edit
  end

  def update
  end

  # unsubscribe.htmlのlink_toでcurrent_customerを記述しているのでcontrollerに記述不要
  def unsubscribe
    # @customer = Customer.find_by(name: params[:name])
  end

  def withdraw
    # @customerをcurrent_customerに変更
    current_customer.update(is_active: false)
    reset_session
    #新規会員登録画面に遷移
    redirect_to new_customer_registration_path

    #redirect_to (/customer/sign_up)
  end

end
