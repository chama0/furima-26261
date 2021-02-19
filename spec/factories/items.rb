FactoryBot.define do
  factory :item do
    name           { Faker::Name.name }
    description    { Faker::Lorem.sentence }
    category_id    { 2 }
    status_id      { 2 }
    shipfee_id     { 2 }
    prefecture_id  { 2 }
    estshipdate_id { 2 }
    price          { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
