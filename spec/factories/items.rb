FactoryBot.define do
  factory :item do
    name        { Faker::Name.name }
    description { Faker::Lorem.sentence }
    category    { Category.all.sample }
    status      { Status.all.sample }
    shipfee     { Shipfee.all.sample }
    prefecture  { Prefecture.all.sample }
    estshipdate { Estshipdate.all.sample }
    price       { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
