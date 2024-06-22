class Order < ApplicationRecord

admin_customer_show
  belongs_to :customer
  has_many :order_details, dependent: :destroy


  belongs_to :customer
  has_many :order_details, dependent: :destroy
 develop

  # enumに関わる記述
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, confirming_payment: 1, in_making: 2, preparing: 3, completed: 4 }

admin_customer_show
  enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}
admin_customer_show
end
end