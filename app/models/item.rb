class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to_active_hash :goods_category
  belongs_to_active_hash :goods_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image
    validates :title
    validates :text
    validates :price
    validates :user
    with_options numericality: { other_than: 1 } do
      validates :goods_category_id
      validates :goods_condition_id
      validates :shipping_charges_id
      validates :shipping_area_id
      validates :shipping_days_id
    end
  end

end
