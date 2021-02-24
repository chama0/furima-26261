FactoryBot.define do
  factory :purchase_address do
    zipcode        { '123-4567' }
    prefecture_id  { 2 }
    municipalities { '神栖市' }
    house_number   { '神栖1-1' }
    building_name  { '神栖ビル' }
    phone_number   { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
