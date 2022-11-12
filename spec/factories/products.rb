FactoryBot.define do
  factory :product do
    name                  {"product"}
    description           {Faker::Lorem.sentence}
    price                 {"10000"}
    category_id           {2}
    condition_id          {2}
    shipping_charge_id    {2}
    prefecture_id         {2}
    shipping_day_id       {2}
    
    user
    
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/zoom.png'), filename: 'zoom.png')
    end
  end

end
