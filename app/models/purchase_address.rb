class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :zipcode, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :zipcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :municipalities
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    user = User.all
    purchase = Purchase.create(user_id: currrent_user.id, item_id: params[item_id])
    Address.create(zipcode: zipcode, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end 