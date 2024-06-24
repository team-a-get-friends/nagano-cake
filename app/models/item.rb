class Item < ApplicationRecord

  # アソシエーションの定義
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_one_attached :item_image
  belongs_to :genre

  # 商品を登録・編集する際に、設定したカラムが空の場合に弾く
# ジャンル選択ができるようになるまでコメントアウト
  # validates :genre_id, presence:true
  validates :name, presence:true
  validates :item_detail, presence:true
  validates :is_active, inclusion: [true, false]
  validates :price, presence:true
  validates :item_image, presence:true

  has_one_attached :item_image

  # 金額算出のメソッドを定義
  def with_tax_price
  (price*1.1).floor
  end

  def subtotal
    item.with_tax_price * amount
  end

  def get_item_image(width,height)
  	item_image.variant(resize_to_limit: [width,height]).processed
  	(item_image.attached?) ? item_image : 'no_image.jpg'
  end

  #検索機能を追加するときはに定義

end
