FactoryBot.define do
  factory :buy_form do
    token                     {"tok_abcdefghijk00000000000000000"}
    postal_code               {'111-1111'}
    shipping_area_id          {2}
    city                      {"sample"}
    address                   {"11"}
    building_name             {"building"}
    phone_number              {11111111111}

    association :user
    association :item
  end
end