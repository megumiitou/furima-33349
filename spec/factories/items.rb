FactoryBot.define do
  factory :item do
    title               {Faker::String.random(length: 1..40)}
    text                {Faker::String.random(length: 1..1000)}
    goods_category_id   {2}
    goods_condition_id  {2}
    shipping_charge_id  {2}
    shipping_area_id    {2}
    shipping_day_id     {2}
    price               {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/furima-intro05.png'), filename: 'test_image.png')
    end
  end
end
