class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  # enumに関わる記述
  # 製作ステータス
  enum making_status: { not_available: 0, waiting_for_making: 1, in_making: 2, completed: 3 }

  def subtotal
    item.with_tax_price * amount
  end

end
