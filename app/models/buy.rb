class Buy < ApplicationRecord
  belongs_to :user
  has_one :item
  has_one :shipping_address

  with_options presence: true do
    validates :user_id
    validates :item_id
  end
end
