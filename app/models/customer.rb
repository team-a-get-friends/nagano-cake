class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #顧客の複数の注文(customer : orders) 1:Nの関係
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy

# 管理者の顧客詳細情報画面(会員ステータス表示)
  def customer_status
    if is_active == false
      "退会"
    else
      "有効"
    end
  end

  def active_for_authentication?
    super && (is_active == true)
  end
end
