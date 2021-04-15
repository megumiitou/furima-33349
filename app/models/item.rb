class Item < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :title
    validates :text
    validates :goods_category_id
    validates :goods_condition_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :shipping_days_id
    validates :price
    validates :user
  end

end
