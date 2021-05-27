class Buy < ApplicationRecord
  belongs_to :user
  has_one :item
  has_one :shipping_address
end
