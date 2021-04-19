class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :goods_category
  belongs_to :goods_condition
  belongs_to :shipping_charges
  belongs_to :shipping_area
  belongs_to :shipping_days

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
