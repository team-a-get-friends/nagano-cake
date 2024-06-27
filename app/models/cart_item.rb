class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  # optional true? 退避：, optional: true
  # 不要なアソシエーション
  # belongs_to :order

  #バリデーションを設定
  validates :customer_id, presence:true
  validates :amount, presence:true

  def subtotal
    item.with_tax_price * amount
  end

end
