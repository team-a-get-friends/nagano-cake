class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.timestamps
      #注文ID
      t.integer :order_id, null: false
      #商品ID
      t.integer :item_id, null: false
      #購入時価格(税込)
      t.integer :price, null: false
      #数量
      t.integer:amount, null: false
      #製作ステータス
      t.integer :making_status, default: 0, null: false
    end
  end
end
