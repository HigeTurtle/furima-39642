FactoryBot.define do
  factory :order_form do

    post_code        { 1234567.to_s.insert(3, "-") }
    prefecture_id    { 2 }
    city             { Faker::Lorem.sentence }
    address          { Faker::Lorem.sentence }
    building         { Faker::Lorem.sentence}
    phone_num        { Faker::Number.decimal_part(digits: 11) }

  end
end
