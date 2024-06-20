class CartItem < ApplicationRecord
  #商品ID
  t.integer :item_id, null: false
  #会員ID
  t.integer :customer_id, null: false
  #数量
  t.integer :amount, null: false
end
