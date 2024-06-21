class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  # enumに関わる記述
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, confirming_payment: 1, in_making: 2, preparing: 3, completed: 4 }

end
