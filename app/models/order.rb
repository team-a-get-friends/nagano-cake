class Order < ApplicationRecord

  #顧客の注文履歴一覧(orderはcusotmerに属している)
  belongs_to :customer
  has_many :order_details, dependent: :destroy

end
