FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password              { password }
    password_confirmation { password }
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    lastname_reading      { person.last.katakana }
    firstname_reading     { person.first.katakana }
    birthday              { Faker::Date.backward }
  end
end 