FactoryBot.define do
  factory :buy_form do
    token                     {"tok_abcdefghijk00000000000000000"}
    postal_code               {'111-1111'}
    shipping_area_id          {2}
    city                      {Faker::String.random(length: 1..10)}
    address                   {Faker::String.random(length: 1..20)}
    phone_number              {11111111111}

    association :user
    association :item
  end
end