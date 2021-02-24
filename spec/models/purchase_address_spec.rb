require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @buyer = FactoryBot.create(:user)
    @seller = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @seller.id)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @buyer.id, item_id: @item.id)
  end

  describe '#create' do
    context '購入情報を保存できる場合' do
      it 'zipcodeとprefecture_idとmunicipalitiesとhouse_numberとphone_numberとbuilding_nameとtokenがあれば保存できること' do
        expect(@purchase_address).to be_valid
      end

      it 'building_nameはなくても保存できること' do
        @purchase_address.building_name = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '購入情報を保存できない場合' do
      it 'zipcodeが空だと保存できないこと' do
        @purchase_address.zipcode = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zipcode can't be blank")
      end

      it 'prefecture_idが空だと保存できないこと' do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalitiesが空だと保存できないこと' do
        @purchase_address.municipalities = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'house_numberが空だと保存できないこと' do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenが空だと保存できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'prefecture_idが初期値のまま(1)だと保存できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'zipcodeに-が入っていない場合は保存できないこと' do
        @purchase_address.zipcode = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Zipcode is invalid')
      end

      it 'phone_numberに-が入っている場合は保存できないこと' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上の場合は保存できないこと' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end