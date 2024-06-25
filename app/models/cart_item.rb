class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  # optional true? 退避：, optional: true
  belongs_to :order

# 小計の計算はamountでは？Itemモデルにも定義
  def subtotal
    item.price_including_tax * quantity
  end

end
