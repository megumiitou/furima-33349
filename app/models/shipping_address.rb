class ShippingAddress < ApplicationRecord

  has_one :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area

end
