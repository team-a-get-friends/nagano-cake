class Item < ApplicationRecord

  # アソシエーションの定義
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  # 金額算出のメソッドを定義
  def with_tax_price
  (price*1.1).floor
  end

  def subtotal
    item.with_tax_price * amount
  end

end
