class OrderDetail < ApplicationRecord
  #注文ID
  t.integer :order_id, null: false
  #商品ID
  t.integer :item_id, null: false
  #購入時価格(税込)
  t.integer :price, null: false
  #数量
  t.integer :amount, null: false
  #製作ステータス
  t.integer :making_status, default: 0, null: false
end
