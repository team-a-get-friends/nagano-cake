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
      #nameカラムがないのでemailカラムで特定(置き換え)
    @customer = Customer.find_by(email: current_customer)
    # @customer = Customer.find_by(name: params[:name])
    #NoMethodError発生で条件分岐追記
    return if @customer.nil?
    return unless customer.valid_password?(params[:customer][:password])
    if customer.is_active == true
      create
    else
      redirect_to (new_customer_registration)
    end
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
