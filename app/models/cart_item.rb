class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  # optional true? 退避：, optional: true
  # 不要なアソシエーション
  # belongs_to :order

  def subtotal
    item.with_tax_price * amount
  end

end
