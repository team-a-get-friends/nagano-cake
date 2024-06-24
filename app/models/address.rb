class Address < ApplicationRecord

  belongs_to :customer

  validates :post_code, presence:true
  validates :address, presence:true
  validates :name, presence:true

  # 登録している情報から住所を一連で表示させるためのメソッド
  def address_display
  '〒' + post_code + ' ' + address + ' ' + name
  end

end
