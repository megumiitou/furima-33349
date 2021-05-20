class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_one :buy

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to_active_hash :goods_category
  belongs_to_active_hash :goods_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image
    validates :title, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :user
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :goods_category_id
    validates :goods_condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  end

end
