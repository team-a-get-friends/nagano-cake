class Admin::CustomersController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_admin!

  def index
    #管理者の顧客一覧記述
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    #該当する会員を見つけて編集する
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "会員情報を更新しました。"
    else
      render :edit
    end
  end
  
  private
  #安全に更新できる属性のみを送信する
  def customer_params 
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :post_code, :address, :phone_number, :is_deleted)
  end

end
