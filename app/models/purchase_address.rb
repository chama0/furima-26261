class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :zipcode, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :zipcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :municipalities
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(zipcode: zipcode, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end 