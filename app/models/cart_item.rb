class CartItem < ApplicationRecord
  #商品ID
  t.inteder item_id, null: false
  #会員ID
  t.inteder customer_id, null: false
  #数量
  t.integer amount, null: false
end
