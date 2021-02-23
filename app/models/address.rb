class Address < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :zipcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :municipalities
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end
end