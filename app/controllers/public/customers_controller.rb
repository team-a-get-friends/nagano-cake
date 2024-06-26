class Public::CustomersController < ApplicationController

  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    # リダイレクト先に会員マイページ
    redirect_to customer_path(params[:id])
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
    redirect_to root_path

    #redirect_to (/customer/sign_up)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,
                                     :first_name,
                                     :last_name_kana,
                                     :first_name_kana,
                                     :post_code,
                                     :address,
                                     :telephone_number,
                                     :email
                                     )
  end
end
