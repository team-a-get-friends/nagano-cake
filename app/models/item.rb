class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  validates :genre_id, presence:true
  validates :name, presence:true
  validates :item_detail, presence:true
  validates is_active, inclusion: [ture, false]
  validates :price, presence:true

　has_one_attached :item_image

  def get_item_image(width,height)
  	item_image.variant(resize_to_limit: [width,height]).processed
  	(profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

　#検索機能を追加するときはに定義

end
