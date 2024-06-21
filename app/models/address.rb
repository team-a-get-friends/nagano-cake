class Address < ApplicationRecord
  
  belongs_to :customer
  
  # 登録している情報から住所を一連で表示させるためのメソッド
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
  
end
