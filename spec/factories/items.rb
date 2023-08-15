FactoryBot.define do
  factory :item do

    name               {Faker::Game.title}
    explanation        {Faker::Lorem.sentence}
    category_id        { 2 }
    condition_id       { 2 }
    charge_id          { 2 }
    prefecture_id      { 2 }
    schedule_id        { 2 }
    price              {Faker::Number.between(from: 300, to: 9999999)}

    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/onepiece14_enel.png'), filename: 'onepiece14_enel.png')
    end

  end
end
