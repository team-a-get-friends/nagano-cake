
class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  # enumに関わる記述
  # 支払方法
  enum payment_method: { credit_card: 0, transfer: 1 }
  # 注文ステータス
  enum status: { waiting_for_payment: 0, confirming_payment: 1, in_making: 2, preparing: 3, completed: 4 }

  #   以下記述は不要？要修正
  #   enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}

  # バリデーションの設定
  validates :payment_method, presence:true
  validates :address, presence:true
  validates :post_code, presence:true
  validates :name, presence:true

  # 送料について定義
  # モデルには定数を書くべきでない
  SHIPPING_FEE = 800

  # ただの数字の呼び出しになってしまい、機能しない
  def self.get_shipping_fee
    SHIPPING_FEE
  end

    # 登録している情報から住所を一連で表示させるためのメソッド
  def address_display
  '〒' + post_code + ' ' + address + ' ' + name
  end

end

