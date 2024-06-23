class Item < ApplicationRecord

  # アソシエーションの定義
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  # 商品を登録・編集する際に、設定したカラムが空の場合に弾く
  with_options presence: true do
    validates :genre_id
    validates :name
    validates :item_detail
    validates :is_active
    validates :price
    validates :image
  end
  has_one_attached :image

  # 金額算出のメソッドを定義
  def with_tax_price
  (price*1.1).floor
  end

  def subtotal
    item.with_tax_price * amount
  end

end
