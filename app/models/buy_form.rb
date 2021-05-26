class BuyForm

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/ }
  end
  validates :shipping_area_id, numericality: { other_than: 1 }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end

end